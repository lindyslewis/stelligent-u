# Lab 2.1.3 - Guide

## Lab 2.1.3: Exclude Private Objects When Uploading to a Bucket

Add a private file to your data directory. Then, upload the directory to your
bucket again **without including the private file**.

`touch data/private`
`aws s3 sync ./data s3://stelligent-u-lindylewis --exclude 'private'`
`aws s3 cp ./data s3://stelligent-u-lindylewis --exclude 'private' --recursive`

- Verify after uploading that the file does not exist in the bucket.

`aws s3 ls s3://stelligent-u-lindylewis`

- Did you find two different ways to accomplish this task? If not, make sure to
  read the [documentation on sync flags](https://docs.aws.amazon.com/cli/latest/reference/s3/sync.html).