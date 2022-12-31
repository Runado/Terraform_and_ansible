provider "aws" {
    region = "us-west-2"
}

module "terraform-alura" {
    source = "C:/Users/josel/terraform-alura"
    ami_id = "ami-0574da719dca65348"
    instance_type = "t2.micro"
    vpc_id = "vpc-00cbad41c1b2cd6f0"
    port = "22"
    cidr_block = "0.0.0.0/0"
}

resource "aws_instance" "ec2-instance" {
    ami = "var.ami_id"
    instance_type = "t2.micro"
    vpc_security_group_ids = "vpc-00cbad41c1b2cd6f0"
}

resource "aws_security_group" "mysg" {
    name = "allow-ssh"
    description = "Allow ssh traffic"
    vpc_id = "vpc-00cbad41c1b2cd6f0"

    ingress {
        description = "Allow inbound ssh traffic"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = "0.0.0.0/0"
    }

    tags = {
        name = "allow_ssh"
    }
}