# Using a count parameter with an index
the purpose of this file is to demonstrate how one can create multiple ec2 instances using the count parameter. To avoid the ec2 instances having the same names, a index is used which iterates through a list of names which are stored as variables. 

### count-index.tf

```sh
provider "aws" {
    region = "us-west-2"
    access key = "YOUR-ACCESS-KEY"
    secret_key = "YOUR-SECRET-KEY"
}

variable "elb_names" {
    type = list
    default = ["dev-loadbalancer", "stage-loadbalanacer","prod-loadbalancer"]
}

resource "aws_instance" "lb" {
    name = var.elb_names[count.index]
    ami = "ami-082b5a644766e0e6f"
    instance_type = "t2.micro"
    count = 3
    path = "/system/"
}

```
