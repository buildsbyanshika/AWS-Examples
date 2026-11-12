import boto3

# Connect to AWS S3
s3 = boto3.client("s3")

# List all S3 buckets
response = s3.list_buckets()

for bucket in response["Buckets"]:
    print(bucket["Name"])
