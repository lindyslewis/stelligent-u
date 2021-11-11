# Lab 2.2.2: Use the CLI to Restrict Access to Private Data

You just made "private.txt" publicly readable. Ensure that only the
bucket owner can read or write that file without changing the
permissions of the other files.

> `aws s3api put-object-acl --acl private --bucket stelligent-u-lindylewis --key private.txt`

##### Question: Modify Permissions

_How could you use "aws s3 cp" or "aws s3 sync" command to modify the
permissions on the file?_

(Hint: see the list of [Canned ACLs](https://docs.aws.amazon.com/AmazonS3/latest/dev/acl-overview.html#canned-acl).)

> `aws s3 sync data/private.txt s3://stelligent-u-lindylewis --acl private`

##### Question: Changing Permissions

_Is there a way you can change the permissions on the file without re-uploading it?_

> `aws s3api put-object-acl --acl private --bucket stelligent-u-lindylewis --key private.txt`