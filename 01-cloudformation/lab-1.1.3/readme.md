# Lab 1.1.3: Pseudo-Parameters

Update the same template by prefixing the name of the bucket with the
Account ID in which it is being created, no matter which account you're
running the template from (i.e., using
[pseudo-parameters](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/pseudo-parameter-reference.html)).

- Use built-in CFN string functions to combine the two strings for the Bucket name.

- Do not hard code the Account ID. Do not use an additional parameter to
  provide the Account ID value.

- Update the stack.

- Commit the changes to your Github repo.
