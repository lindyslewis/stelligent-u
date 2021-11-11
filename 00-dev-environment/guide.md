# Lab 0.1.1 AWS Access Keys

## Create Access key in AWS Console
1. Navigate to IAM and click on your user.
1. Go to the Security Credentials tab
1. Click Create Access Key
1. Download .csv file and store it someplace safe

## Get Temporary Credentials (Manaual Method)

`serial-number` is the arn located in the IAM Security Credentials tab in the AWS Console
`token-code` is the token from your MFA device

```
aws sts get-session-token \
    --serial-number arn:aws:iam::324320755747:mfa/lindy.lewis.labs \
    --token-code 123456` \
/
```
This will return json containing the temporary credentials

```
"Credentials": {
    "SecretAccessKey": "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY",
    "SessionToken": "AQoDYXdzEJr...<remainder of security token>",
    "Expiration": "2018-10-11T10:09:50Z",
    "AccessKeyId": "ASIAIOSFODNN7EXAMPLE",
  }
}
```

Open the `~/.aws/credentials` file and add the following for the `[temp]` profile.

```
[temp]
output = json
region = us-east-1
aws_access_key_id = AKIAIOSFODNN7EXAMPLE
aws_secret_access_key = wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
aws_session_token = AQoDYXdzEJr...<remainder of security token>
```

Now set your `AWS_PROFLE` environment variable to `temp`

```
export AWS_PROFILE=temp
```

Use the following syntax to access the AWS CLI 
```
aws --profile temp s3api list-buckets
```

## Get Temporary Credentials (Automated using auto-mfa.sh)

Run auto-mfa.sh and follow the prompts

```
./auto-mfa.sh
```

Now set your `AWS_PROFLE` environment variable to `labs-mfa`

```
export AWS_PROFILE=labs-mfa
```

Use the following syntax to access the AWS CLI 

```
aws s3api list-buckets
```