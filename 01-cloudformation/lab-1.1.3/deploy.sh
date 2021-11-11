#!/bin/bash
# Use this script as a quick execute shim for testing cfn stacks
STACKNAME="lindy-lewis-test-stack-su-1-1-3"
TESTFILE="file://create_bucket.yaml"
PARAMFILE="file://parameters.json"

aws cloudformation create-stack --stack-name $STACKNAME --template-body $TESTFILE --parameters $PARAMFILE