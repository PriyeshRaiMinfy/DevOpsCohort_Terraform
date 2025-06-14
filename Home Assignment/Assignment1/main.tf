terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

# provider "aws" {
#     region = var.aws_region
# }
provider "aws" {
    region  = "ap-south-1"
    profile = "AdminAccess-611837361078"
}



#S3 bucket for static website hosting
resource "aws_s3_bucket" "static_site" {
    bucket        = var.bucket_name
    force_destroy = true
}

resource "aws_s3_bucket_public_access_block" "public_access" {
    bucket = aws_s3_bucket.static_site.id
    
    block_public_acls       = false
    block_public_policy     = false
    ignore_public_acls      = false
    restrict_public_buckets = false
}

#website hosting
resource "aws_s3_bucket_website_configuration" "static_site" {
    bucket = aws_s3_bucket.static_site.bucket
    index_document {
        suffix = "index.html"
    }
}

#making index.html publicaly readable
data "aws_iam_policy_document" "public_read_policy" {
    statement {
        actions   = ["s3:GetObject"]
        resources = ["${aws_s3_bucket.static_site.arn}/*"]
        principals {
            type        = "AWS"
            identifiers = ["*"]
        }
            effect = "Allow"
    }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
    bucket = aws_s3_bucket.static_site.id
    policy = data.aws_iam_policy_document.public_read_policy.json
}

# Upload index.html
resource "aws_s3_object" "index_file" {
    bucket       = aws_s3_bucket.static_site.bucket
    key          = "index.html" 
    source       = "${path.module}/index.html"
    content_type = "text/html"
}
