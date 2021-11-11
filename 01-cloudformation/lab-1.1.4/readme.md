# Lab 1.1.4: Using Conditions

Update the same template one final time. This time, use a CloudFormation
[Condition](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/conditions-section-structure.html)
to add a prefix to the name of the bucket. When the current execution
region is your preferred region, prefix the bucket name with the
Account ID. When executing in all other regions, use the region
name.

- Update the stack that you originally deployed.

- Create a new stack _with the same stack name_, but this time
  deploying to some region other than your preferred region.

- Commit the changes to your Github repo.
