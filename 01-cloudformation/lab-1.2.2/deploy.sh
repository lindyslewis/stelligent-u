#!/bin/bash
# Use this script as a quick execute shim for testing cfn stacks
STACKNAME="lindy-lewis-test-stack-su-1-2-2"
TESTFILE="file://iam_user.yaml"
PARAMFILE="file://parameters.json"

# Create Stack
aws cloudformation create-stack --stack-name $STACKNAME --capabilities CAPABILITY_NAMED_IAM --template-body $TESTFILE --parameters $PARAMFILE

# Delete Stack
# aws cloudformation delete-stack --stack-name $STACKNAME --capabilities CAPABILITY_NAMED_IAM

# Check if a Stack Exists
# aws cloudformation describe-stacks --stack-name $STACKNAME

# Enable Termination Protection
# aws cloudformation update-termination-protection --enable-termination-protection --stack-name $STACKNAME

# Disable Termination Protection
# aws cloudformation update-termination-protection --no-enable-termination-protection --stack-name $STACKNAME

# List Exports
# aws cloudformation list-exports