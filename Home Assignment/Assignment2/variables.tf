variable "aws_region" {
    type        = string
    default     = "ap-south-1"
}

variable "instance_type" {
    type        = string
    default     = "t2.micro"
}

variable "web_server_ami" {
    description = "AMI ID to use for EC2"
    type        = string
    default     = "ami-0f5ee92e2d63afc18" # Amazon Linux 2 in ap-south-1
}

variable "instance_count" {
    description = "Number of EC2 instances to launch"
    type        = number
    default     = 4
}
