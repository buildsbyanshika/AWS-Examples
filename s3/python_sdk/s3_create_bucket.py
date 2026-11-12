
import boto3
import random
import string
import uuid
from datetime import datetime

# AWS region
REGION = "ap-southeast-2"

# Connect to AWS S3
s3 = boto3.client("s3", region_name=REGION)

# Generate a globally unique bucket name
bucket_name = f"python-s3-test-{uuid.uuid4().hex[:12]}"

# Generate random filename
random_filename = (
    "random_file_" +
    "".join(random.choices(string.ascii_lowercase, k=8)) +
    ".txt"
)

# Generate random text
random_text = " ".join(
    "".join(random.choices(string.ascii_letters, k=8))
    for _ in range(20)
)

# Add timestamp
content = f"""
AWS S3 Python SDK Test

Bucket: {bucket_name}
Filename: {random_filename}
Created: {datetime.now()}

Random Text:
{random_text}

S3 upload successful!
"""

try:
    # Create S3 bucket
    print("Creating S3 bucket...")

    s3.create_bucket(
        Bucket=bucket_name,
        CreateBucketConfiguration={
            "LocationConstraint": REGION
        }
    )

    print(f"Bucket created: {bucket_name}")

    # Upload random text file
    print("Uploading random file...")

    s3.put_object(
        Bucket=bucket_name,
        Key=random_filename,
        Body=content.encode("utf-8"),
        ContentType="text/plain"
    )

    print("File uploaded successfully!")

    # Verify uploaded file
    response = s3.get_object(
        Bucket=bucket_name,
        Key=random_filename
    )

    downloaded_content = response["Body"].read().decode("utf-8")

    print("\n========== S3 TEST SUCCESS ==========")
    print("Bucket:", bucket_name)
    print("File:", random_filename)
    print("Content:\n", downloaded_content)

except Exception as e:
    print("AWS S3 Error:", e)
