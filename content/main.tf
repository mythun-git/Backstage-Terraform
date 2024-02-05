provider "aws" {
  region = ${{ values.bucketRegion }} 
}

resource "aws_s3_bucket" "microsegmentations3bucket" #${{ parameters.name }}
  bucket = ${{ values.bucketName }} # { #${{ parameters.bucketName }}
  
}

resource "aws_s3_access_point" "msaccesspoint" {
  name          = "access-point"
  bucket        = aws_s3_bucket.microsegmentations3bucket.bucket  ## aws_s3_bucket.${{ parameters.name }}.bucket
  vpc_configuration {
    vpc_id = "vpc-005aa4d379e350404"
  }
}
