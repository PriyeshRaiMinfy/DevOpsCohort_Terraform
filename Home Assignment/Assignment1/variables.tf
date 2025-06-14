variable "aws_region" {
    type        = string
    default     = "ap-south-1"
}

variable "bucket_name" {
    #unique S3 bucket name - static website
    type        = string
    default = "priyeshrai-staticwebsite"
}

variable "remoteBackend" {
    type = string
    default = "Assignment1remoteBackend_Bucket"
}