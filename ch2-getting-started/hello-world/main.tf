#passing in keys via environmental variables
provider "aws" {
#	access_key	= ""
#	secret_key	= ""
	region 		= "us-east-1"
}

resource "aws_instance" "example" {
	ami		= "ami-0f40c8f97004632f9"
	instance_type	= "t2.micro"
}
