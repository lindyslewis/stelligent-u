# Lab 1.1.2: Stack Parameters

Update the same template by adding a CloudFormation
[Parameter](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html)
to the stack and use the parameter's value as the name of the S3 bucket.

- Put your parameter into a separate JSON file and pass that file to the CLI.

- Update your stack.

- Add the template changes and new parameter file to your Github repo.

## Create Stack
```
aws cloudformation create-stack --stack-name lindy-lewis-test-stack-su-1-1-2 --template-body file://create_bucket.yaml --parameters file://parameters.json
```
