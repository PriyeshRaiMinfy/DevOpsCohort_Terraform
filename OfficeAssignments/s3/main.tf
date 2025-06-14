provider "aws" {
    region  = "ap-south-1"
    profile = "priyesh"  # make sure this profile exists in ~/.aws/credentials
}


resource "aws_s3_bucket" "terraform_state" {
    bucket = "priyesh-s3-8181" 
    #acl = "private"
    tags = {
        Name = "MyBucket"
        Environment = "Dev"
    }
}