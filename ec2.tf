/*
resource "aws_instance" "my_instance" {

}

# <BLOCK_TYPE> <RESOURCE_TYPE> <BLOCK_NAME> {
#     # Configuration
# }
*/

provider "aws" {
    region = "us-east-1"
}

data "aws_subnet" "my_subnet" {
    id = var.subnet_id
}

resource "aws_bucket" "new_bucket" {
    name = "my-on-cdec-bux"
    region = "us-east-1"
}

resource "aws_security_group" "my_sg" {
    name = "my-sg"
    description = "allow HTTP Port"
    ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "TCP"
        cidr_blocks      = ["0.0.0.0/0"]
    }
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "instance_1" {
    ami = var.image_id
    instance_type = var.instance_type
    key_name = var.key_pair
#    security_groups = var.sg_name
    vpc_security_group_ids = [aws_security_group.my_sg.id]
    subnet_id = var.subnet_id
    user_data = <<-EOF
        #!/bin/bash
        yum install httpd -y
        systemctl start httpd
        systemctl enable httpd
    EOF
}

variable "image_id" {
  type        = string
  default     = "ami-012967cc5a8c9f891"
  description = "Enter AMI ID"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "key_pair" {
    default = "new-key-nv"
}

variable "subnet_id" {
    default = "subnet-091678d44aa5db41d"
}

# variable "sg_name" {
#     type = list
#     default = ["default"]
# }

output "demo" {
    value = "Hello World"
}

output "public_ip" {
    value = aws_instance.instance_1.public_ip
}

output "arn_subnet" {
    value = data.aws_subnet.my_subnet.arn
}