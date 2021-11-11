# Lab 2.2.1: Recreate the Bucket with Public Data

Create your bucket again and upload the contents of your "data"
directory with the "aws s3 sync" command.

- Include the "private.txt" file this time.

- Use a "sync" command parameter to make all the files in the bucket
  publicly readable.

> `aws s3 mb s3://stelligent-u-lindylewis --region 'us-west-2'`

> `aws s3 sync ./data s3://stelligent-u-lindylewis --acl public-read`

## Question: Downloading Protection

_After this, can you download one of your files from the bucket without using
your API credentials?_