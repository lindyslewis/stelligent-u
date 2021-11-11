# Lab 2.1.4 - Guide

## Lab 2.1.4: Clean Up

Clean up: remove your bucket. What do you have to do before you can
remove it?

> Delete the contents
> `aws s3 rm s3://stelligent-u-lindylewis/ --region 'us-west-2' --recursive`

> Delete the bucket
> `aws s3 rb s3://stelligent-u-lindylewis --region 'us-west-2'`