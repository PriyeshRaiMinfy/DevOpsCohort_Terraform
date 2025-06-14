# AWS console -> EC2 -> Launch Instance
resource "aws_instance" "priyesh-webapplication" {
    ami                         = var.ami_id                # Selecting AMI (e.g., Amazon Linux 2)
    instance_type               = var.instance_type         # Select instance type ec2.micro
    subnet_id                   = var.subnet_id             # Choose VPC subnet to launch into
    vpc_security_group_ids      = var.security_group_ids    # Attach security groups
    associate_public_ip_address = true                      # Auto-assign public IP

    tags = var.tags             # Tags (like setting Name=WebServer in AWS Console)
}





# resource "aws_instance" "priyesh-webapplication" {
#     count                       = var.instance_count
#     ami                         = var.ami_id
#     instance_type               = var.instance_type
#     subnet_id                   = var.subnet_id
#     vpc_security_group_ids      = var.security_group_ids
#     associate_public_ip_address = true

#     tags = merge(var.tags, {
#         "Name" = "webserver-${count.index + 1}"
#     })
# }




