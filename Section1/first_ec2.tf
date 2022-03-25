provider "aws" {
    region = "us-east-1"
    access_key = "PUT-YOUR-ACCESS-KEY-HERE"
    secret_key = "PUT-YOUR-SECRET-KEY-HERE"
}

resource "aws_instance" "myEC2" {
  ami           = "ami-0c02fb55956c7d316" 
  instance_type = "t2.micro"

  tags = {
    Name = "helloWorld"
  }
}