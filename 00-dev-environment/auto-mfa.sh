#!/bin/bash

set -e

MFA_SERIAL_FILE=.mfaserial # Location of stored AWS MFA device ARN
AWS_TOKEN_FILE=.awstoken # Location of mfa credentials response
TMP_DIR=~/.mfatemp # Path for files supporting script
AWS_MFA_PROFILE=labs-mfa # Set to desired aws profile

if [ ! -z "$AWS_PROFILE" ]; then
    echo "AWS_PROFILE env variable is set, unable to continue."
    echo "Unset AWS_PROFILE and run script again."
    exit 1
fi

mkdir -p $TMP_DIR

# Check for existing Device ARN and prompt if not present
if [ ! -e $TMP_DIR/$MFA_SERIAL_FILE ]; then
    while true; do
        read -p "Please input the MFA Device ARN:" mfa
        case $mfa in
            "") echo "Value incorrect, please input a valid MFA ARN.";;
            * ) echo $mfa > $TMP_DIR/$MFA_SERIAL_FILE; break;;
        esac
    done
fi

# Read contents of serial file for use later on
MFA_SERIAL=`cat $TMP_DIR/$MFA_SERIAL_FILE`

# Get AWS mfa credentials for specified account
getMfa(){
    while true; do
        read -p "6-digit MFA code:" token
        case $token in
            [0-9][0-9][0-9][0-9][0-9][0-9] ) MFA_TOKEN=$token; break;;
            * ) echo "Please input a valid 6-digit pin." ;;
        esac
    done

    # Get credentials from AWS
    authOutput=`aws sts get-session-token --serial-number ${MFA_SERIAL} --token-code ${MFA_TOKEN}`

    echo $authOutput > $TMP_DIR/$AWS_TOKEN_FILE;
}

# Set AWS Credentials 
setCredentials(){
    _AWS_ACCESS_KEY_ID=`echo ${authOutput} | jq -r '.Credentials.AccessKeyId'`
    _AWS_SECRET_ACCESS_KEY=`echo ${authOutput} | jq -r '.Credentials.SecretAccessKey'`
    _AWS_SESSION_TOKEN=`echo ${authOutput} | jq -r '.Credentials.SessionToken'`

    aws configure set aws_access_key_id ${_AWS_ACCESS_KEY_ID} --profile ${AWS_MFA_PROFILE}
    aws configure set aws_secret_access_key ${_AWS_SECRET_ACCESS_KEY} --profile ${AWS_MFA_PROFILE}
    aws configure set aws_session_token ${_AWS_SESSION_TOKEN} --profile ${AWS_MFA_PROFILE}
}

# Check for expired or non existant credentials and populate if necessary
if [ -e $TMP_DIR/$AWS_TOKEN_FILE ]; then
    authOutput=`cat $TMP_DIR/$AWS_TOKEN_FILE`
    authExpiry=`echo $authOutput | jq -r '.Credentials.Expiration'`
    currentTime=`date -u +'%Y-%m-%dT%H:%M:%SZ'`

    if [ "$authExpiry" \< "$currentTime" ]; then
        echo "Token expired, prompting for new MFA code..."
        getMfa
        setCredentials
        echo "Credentials have been added to the ${AWS_MFA_PROFILE} profile."
        authExpiry=`echo $authOutput | jq -r '.Credentials.Expiration'`
        echo "Token will expire at ${authExpiry}."
    else
        echo "Token is valid, you can access the credentials from the ${AWS_MFA_PROFILE} profile."
        echo "Token will expire at ${authExpiry}."
    fi
else
    echo "No exsiting token found, requesting new token from AWS..."
    getMfa
    setCredentials
    echo "Credentials have been added to the ${AWS_MFA_PROFILE} profile."
    authExpiry=`echo $authOutput | jq -r '.Credentials.Expiration'`
    echo "Token will expire at ${authExpiry}."
fi
