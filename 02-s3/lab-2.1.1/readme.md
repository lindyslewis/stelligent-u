# Lab 2.1.1: Create a Bucket

S3 buckets are located in regions, but their names are globally unique.
Using "aws s3", create a bucket:

- Use the us-west-2 region.

- Call the bucket "stelligent-u-_your-AWS-username_".

> `aws s3 mb s3://stelligent-u-lindylewis --region 'us-west-2'`


- List the contents of the bucket.

> `aws s3 ls s3://stelligent-u-lindylewis`

