# Lab 2.1.1 - Guide

## Lab 2.1.1: Create a Bucket

S3 buckets are located in regions, but their names are globally unique.
Using "aws s3", create a bucket:

- Use the us-west-2 region.

- Call the bucket "stelligent-u-_your-AWS-username_".

- List the contents of the bucket.


## Commands Used

```
# Create a Bucket
aws s3api create-bucket --bucket stelligent-u-lindylewis --region us-west-2 --create-bucket-configuration LocationConstraint=us-west-2
```

```
# List Items in the Bucket
aws s3 ls s3://stelligent-u-lindylewis
```