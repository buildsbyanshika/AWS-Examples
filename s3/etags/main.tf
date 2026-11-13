terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.2"
  
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "default" {

}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.default.id
  key = "myfile.txt"
  source = "myfile.txt"

  
  etag = filemd5("myfile.txt")
}