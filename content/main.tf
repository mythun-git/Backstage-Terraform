provider "aws" {
  region = "us-west-1"  # ${{ parameters.bucketRegion }} 
}

resource "aws_s3_bucket" "microsegmentations3bucket" { #${{ parameters.name }}
  bucket = "microsegmentations3" # { ${{ parameters.bucketName }}
  
}

resource "aws_s3_access_point" "msaccesspoint" {
  name          = "access-point"
  bucket        = aws_s3_bucket.microsegmentations3bucket.bucket  ## aws_s3_bucket.${{ parameters.name }}.bucket
  vpc_configuration {
    vpc_id = "vpc-005aa4d379e350404"
  }
}
