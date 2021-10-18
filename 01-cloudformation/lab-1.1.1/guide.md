# Lab 1.1.1 Guide

## Lab 1.1.1: CloudFormation Template Requirements

Create the *most minimal CFN template possible* that can be used to
create an AWS Simple Storage Service (S3) Bucket.

- Always write your CloudFormation [templates in YAML](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-formats.html).

- Launch a Stack by [using the AWS CLI tool](https://docs.aws.amazon.com/cli/latest/reference/cloudformation/create-stack.html)
  to run the template. Use your preferred region.

- Note the output provided by creating the Stack.

- Though *functionally* unnecessary, the Description (i.e. its *purpose*)
  element documents your code's *intent*, so provide one. The Description
  key-value pair should be at the _root level_ of your template. If you place
  it under the definition of a resource, AWS will allow the template's creation
  but your description will not populate anything. See
  [here](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
  for a useful guide to the anatomy of a template as well as
  [YAML terminology](https://yaml.org/spec/1.2/spec.html#id2759768).

- Commit the template to your Github repository under the 01-cloudformation
  folder.


## Create Stack
```
aws cloudformation create-stack --stack-name lindy-lewis-test-stack --template-body file://create_bucket.yaml
```
