variable "ami_id" {
    type = string
}

variable "instance_type" {
    type    = string
    default = "t2.micro"
}

variable "subnet_id" {
    type = string
}

variable "security_group_ids" {
    type = list(string)
}

variable "tags" {
    type = map(string)
}

# variable "instance_count" {
#     type    = number
#     default = 3
# }
