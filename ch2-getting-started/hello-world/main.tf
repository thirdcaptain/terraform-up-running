# passing in keys via environmental variables
provider "aws" {
#	access_key	= ""
#	secret_key	= ""
	region 		= "us-east-1"
}

resource "aws_instance" "example" {
	ami						= "ami-0f40c8f97004632f9"
	instance_type			= "t2.micro"
	vpc_security_group_ids 	= [aws_security_group.instance.id]

	user_data = <<-EOF
				#!/bin/bash
				 echo "Hello, World" > index.html
				 nohup busybox httpd -f -p 8080 &
				 EOF

	tags = {
		Name = "terraform-example"
	}
}

resource "aws_security_group" "instance" {
	name = "terraform-example-instance"

	ingress {
		from_port	= 8080
		to_port		= 8080
		protocol 	= "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
}