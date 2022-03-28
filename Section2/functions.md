## Functions

Functions executed in this file:

-- formatdate

-- lookup


The lookup function in this file: 

1. The first input is var.ami, note this has to be a map

2. The second input is var.region, this is the key. As the key is ap-south-1, the ami selected will be "ami-0470e33cd681b2476"

```sh
provider "aws" {
  region     = var.region
  access_key = "YOUR-ACCESS-KEY"
  secret_key = "YOUR-SECRET-KEY"
}

locals {
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

variable "region" {
  default = "ap-south-1"
}

variable "tags" {
  type = list
  default = ["firstec2","secondec2"]
}

variable "ami" {
  type = map
  default = {
    "us-east-1" = "ami-0323c3dd2da7fb37d"
    "us-west-2" = "ami-0d6621c01e8c2de2c"
    "ap-south-1" = "ami-0470e33cd681b2476"
  }
}

resource "aws_key_pair" "loginkey" {
  key_name   = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
}

resource "aws_instance" "app-dev" {
   ami = lookup(var.ami,var.region)
   instance_type = "t2.micro"
   key_name = aws_key_pair.loginkey.key_name
   count = 2

   tags = {
     Name = element(var.tags,count.index)
   }
}


output "timestamp" {
  value = local.time
}

```