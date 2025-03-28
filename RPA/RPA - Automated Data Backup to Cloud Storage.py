# Import necessary libraries
import boto3
import os

# Set up the S3 client
s3 = boto3.client('s3')

# Define the local directory and S3 bucket
local_directory = '/path/to/files'
bucket_name = 'your-bucket-name'

# Upload each file to the S3 bucket
for filename in os.listdir(local_directory):
    local_file = os.path.join(local_directory, filename)
    s3.upload_file(local_file, bucket_name, filename)