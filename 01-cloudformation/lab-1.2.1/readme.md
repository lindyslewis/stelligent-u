# Lab 1.2.1: Cross-Referencing Resources within a Template

Create a CFN template that describes two resources: an IAM User, and an
IAM Managed Policy that controls that user.

- The policy should allow access solely to 'Read' actions against all
  S3 Buckets (including listing buckets and downloading individual bucket contents)

- Attach the policy to the user via the template.

- Use a CFN Parameter to set the user's name

- Create the Stack.