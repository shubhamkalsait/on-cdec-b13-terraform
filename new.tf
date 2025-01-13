provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "my_instance" {
    ami = "image-id"
    instance_type = "t2.micro"
    vpc_security_group_ids = [""]
    key_name = "new-ac-shubham"
}

resource "aws_vpc" {
    name = "my-vpc"
    cidr_block = "10.10.0.0/16"
}