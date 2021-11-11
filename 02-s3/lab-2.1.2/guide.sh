# Lab 2.1.2 - Guide

## Lab 2.1.2: Upload Objects to a Bucket

Add an object to your bucket:

- Create a local subdirectory, "data", for s3 files and put a few
  files in it.

- Copy the file to your bucket using the "aws s3" command. Find more
  than one way to upload it.

- List the contents of the bucket after each upload.


## Commands Used

```
# Create a local subdirectory, "data", for s3 files and put a few files in it.
mkdir data
touch file1
touch file 2
```

```
# Copy the file to your bucket using the "aws s3" command. 
aws s3 cp data/file1 s3://stelligent-u-lindylewis/file1

aws s3 cp data/file2 s3://stelligent-u-lindylewis/file2
```

```
# List Items in the Bucket
aws s3 ls s3://stelligent-u-lindylewis
```