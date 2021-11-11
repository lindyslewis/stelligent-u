# Lab 2.2.3: Using the API from the CLI

The [aws s3api command](https://docs.aws.amazon.com/cli/latest/reference/s3api/index.html#s3api)
gives you a lot more options. Remove the bucket again, then recreate it
to start fresh.

>`aws s3 rm s3://stelligent-u-lindylewis/ --recursive`
>`aws s3 rb s3://stelligent-u-lindylewis/`
>`aws s3api create-bucket --bucket stelligent-u-lindylewis --acl public-read --create-bucket-configuration LocationConstraint='us-west-2'`

Make all files publicly readable, grant yourself access to do anything
to all files, and block access to "private.txt" unless you're an
authenticated user:

- Create and assign an IAM policy to explicitly grant yourself
  maintenance access.

- Set a bucket policy to grant public read access.

>`aws s3api put-bucket-acl --bucket stelligent-u-lindylewis --grant-full-control id=325cbed028b3247baa4404c5c980cc7554f85fc72bd5140692f3b781beedeb33 --grant-read uri=http://acs.amazonaws.com/groups/global/AllUsers`

- Set an S3 ACL on "private.txt" to block read access unless you're
  authenticated.

>`aws s3api put-object-acl --bucket stelligent-u-lindylewis --key private.txt --grant-full-control emailaddress=user1@example.com,emailaddress=user2@example.com --grant-read uri=http://acs.amazonaws.com/groups/global/AllUsers`

When you're done, verify that anybody (e.g. you, unauthenticated) can
read most files but can't read "private.txt", and only you can modify
file and read "private.txt".

#### Question: Reading Policy

_What do you see when you try to read the existing bucket policy before you
replace it?_

#### Question: Default Permissions

_How do the default permissions differ from the policy you're setting?_