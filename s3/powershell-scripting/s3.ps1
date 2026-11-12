Import-Module AWS.Tools.S3

$region = "ap-southeast-2"

$bucketname = Read-Host -Prompt "Enter your bucket name:"

Write-Host "AWS Region: " $region

Write-Host "S3 Bucket: " $bucketname

function BucketExists{
    $bucket = Get-S3Bucket -BucketName $bucketname -ErrorAction SilentlyContinue
    return $null -ne $bucket
}

if (-not(BucketExists)){
    Write-Host "Bucket not exists..."
    New-S3Bucket -BucketName $bucketname -Region $region
}else{
    Write-Host "Bucket already exits..."
}


#Create a file
$filename = 'myfile.txt'
$filecontent = 'Hello from Poweshell Scripting!!'

Set-Content -Path $filename -Value $filecontent

Write-S3Object -BucketName $bucketname -File $filename -Key $filename -Region $region
# New-S3Bucket BucketName $bucketname Region $region