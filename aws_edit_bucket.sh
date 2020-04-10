#!/bin/bash
echo Welcome to S3 bucket editor.\ Please enter the remote s3 bucket unique name:

read bucket_name

echo OK.

echo Enter the path to \local directory:

read local_directory

echo Details:\ s3 bucket:  s3://$bucket_name \ \local directory: $local_directory

read -p "Press {Enter} to continue"

sed -i -e "s/export BUCKET_NAME.*/export BUCKET_NAME=$bucket_name/" .bashrc
sed -i -e "s/export LOCAL_DIRECTORY.*/export LOCAL_DIRECTORY=$local_directory/" .bashrc

aws s3 sync s3://$bucket_name $local_directory
. .bashrc
$EDITOR $local_directory





