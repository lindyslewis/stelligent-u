# Lab 2.1.2 - Guide

## Lab 2.1.2: Upload Objects to a Bucket

Add an object to your bucket:

- Create a local subdirectory, "data", for s3 files and put a few
  files in it.

> ```
> mkdir data
> touch file1
> touch file 2
> ```

- Copy the file to your bucket using the "aws s3" command. Find more
  than one way to upload it.

> `aws s3 cp file1 s3://stelligent-u-lindylewis/file1`
> `aws s3 sync . s3://stelligent-u-lindylewis/file2`


- List the contents of the bucket after each upload.

> `aws s3 ls s3://stelligent-u-lindylewis`

##### Question: Copying to Top Level

_How would you copy the contents of the directory to the top level of your bucket?_

> `aws s3 sync ./data s3://stelligent-u-lindylewis`

##### Question: Directory Copying

_How would you copy the contents and include the directory name in the s3 object paths?_

> `aws s3 cp ./data s3://stelligent-u-lindylewis --recursive`

##### Question: Object Access

_[Can anyone else see your file yet](https://docs.aws.amazon.com/AmazonS3/latest/dev/s3-access-control.html)?_

For further reading, see the S3 [Access Policy Language Overview](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-policy-language-overview.html).

> File Access is based on the default bucket settings thus far. There have been no policies applied yet. 
> Thus, the answer of "can anyone else see my file yet?" would be no. Not unless they have more 
> permissions than I, the creator of the file, have. (root AWS account)

##### Question: Sync vs Copy

_What makes "sync" a better choice than "cp" for some S3 uploads?_

> By default, sync will only move new and updated files, reducing overwrite bandwidth.