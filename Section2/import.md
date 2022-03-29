## Importing resources

Use case: Some infrastructure is already in place, and then you decide you want to use terraform. To interact with that already created infrastructure, you must import the resources first. In order to import the infrastracture, the resources must be created manually. 

Note when importing, terraform will not generate a .tf file for you, it will only generate a state file. 


Example: you already have a ec2

Step 1: create the ec2 by matching the ami, SG, keypairname, tag, instance type

Step 2: run terraform import aws_instance.myec2 instance_id 

where the first import is the resource

### ec2.tf

```sh
resource "aws_instance" "myec2" {
  ami = "ami-bf5540df"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-6ae7d613", "sg-53370035"]
  key_name = "remotepractical"
  subnet_id = "subnet-9e3cfbc5"

  tags {
    Name = "manual"
  }
}
```

### providers.tf

```sh
provider "aws" {
  region = "us-west-1"
}
```

### Command to import resource

```sh
terraform import aws_instance.myec2 i-041886ebb7e9bd20
```
