provider "aws" {
  region  = "ap-south-1"
  profile = "TerrafornUser"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-unique-bucket-priysh-001"  
  # ye globally unique hai
}
