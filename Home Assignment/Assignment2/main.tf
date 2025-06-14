provider "aws" {
    region = var.aws_region
    profile = "priyesh"
}
# 1st creating a vpc
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "assignment-vpc"
    }
}

# 2nd creating subnet
resource "aws_subnet" "public" {
    vpc_id                  = aws_vpc.main.id
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "ap-south-1a"
    map_public_ip_on_launch = true
    
    tags = {
        Name = "assignment-public-subnet"
    }
}

#3rd creating internet gateway - for internet access
resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "assignment-igw"
        }
}

#4th route table
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }
    tags = {
        Name = "assignment-public-rt"
    }
}

#5th associate the subnet with the route table
resource "aws_route_table_association" "rta" {
    subnet_id      = aws_subnet.public.id
    route_table_id = aws_route_table.rt.id
}
resource "aws_security_group" "web_sg" {
    name        = "web-sg"
    description = "Allow HTTP and SSH"
    vpc_id      = aws_vpc.main.id
    
    
    
    
    
    ingress {
        description = "HTTP"
        from_port   = 80
        to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "SSH"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
}

tags = {
    Name = "web-sg"
}
}

# module "priyesh-webapplication" {
#     source = "./modules/ec2_instance"
    
#     count = 4 // i want to make 4 instences simultaniously with the same modeule


#     instance_type      = var.instance_type
#     ami_id             = var.web_server_ami
#     subnet_id          = aws_subnet.public.id
#     security_group_ids = [aws_security_group.web_sg.id]
    
#     tags = {
#         Name = "priyesh-webapplication-${count.index}"  #for unique names
#     }
# }

module "priyesh-webapplication" {
    source              = "./modules/ec2_instance"
    # count               = 4
    count = var.instance_count
    
    instance_type       = var.instance_type
    ami_id              = var.web_server_ami
    subnet_id           = aws_subnet.public.id
    security_group_ids  = [aws_security_group.web_sg.id]

    tags = {
        Name = "priyesh-webapp-${count.index + 1}"
    }
}
