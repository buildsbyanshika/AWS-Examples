$region = "ap-southeast-2"

# Get all S3 buckets
$buckets = Get-S3Bucket

foreach ($bucket in $buckets) {

    $bucketName = $bucket.BucketName

    Write-Host "Processing bucket: $bucketName"

    # Get all objects inside the bucket
    $objects = Get-S3Object -BucketName $bucketName -Region $region

    # Delete all objects
    foreach ($object in $objects) {

        Remove-S3Object -BucketName $bucketName `
                        -Key $object.Key `
                        -Region $region `
                        -Force

        Write-Host "Deleted file: $($object.Key)"
    }

    # Delete the empty bucket
    Remove-S3Bucket -BucketName $bucketName `
                    -Region $region `
                    -Force

    Write-Host "Bucket deleted: $bucketName"
}

Write-Host "All buckets processed!"