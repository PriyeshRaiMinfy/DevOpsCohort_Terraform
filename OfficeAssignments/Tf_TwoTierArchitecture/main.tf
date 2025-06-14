resource "aws_vpc" "day2-priyesh-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "main-vpc"
        }
}

resource "aws_subnet" "day2-priyesh-public-subnet" {
    vpc_id                  = aws_vpc.day2-priyesh-vpc.id
    cidr_block              = "10.0.1.0/24"
    map_public_ip_on_launch = true
    availability_zone       = "ap-south-1a"
    tags = {
        Name = "public-subnet"
    }
}

resource "aws_internet_gateway" "day2-priyesh-igw" {
  vpc_id = aws_vpc.day2-priyesh-vpc.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "day2-priyesh-public_rt" {
  vpc_id = aws_vpc.day2-priyesh-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.day2-priyesh-igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.day2-priyesh-public-subnet.id
  route_table_id = aws_route_table.day2-priyesh-public_rt.id
}

resource "aws_security_group" "day2-priyesh-web_sg" {
  name        = "day2-priyesh-web-sg"
  description = "Allow HTTP and SSH"
  vpc_id      = aws_vpc.day2-priyesh-vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["14.194.147.50/32"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
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
    Name = "web-security-group"
  }
}

resource "aws_instance" "day2-priyesh-web_server" {
  ami                         = "ami-0b09627181c8d5778"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.day2-priyesh-public-subnet.id
  vpc_security_group_ids      = [aws_security_group.day2-priyesh-web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y httpd
              systemctl start httpd
              systemctl enable httpd
              echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html
            EOF

  tags = {
    Name = "WebServer"
  }
}
