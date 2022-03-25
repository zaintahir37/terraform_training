provider "aws" {
  region     = "us-east-1"
    access_key = "AKIA2HG3GS26X5YCDAND"
    secret_key = "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"
}

resource "aws_eip" "lb" {
  vpc      = true
}

output "eip" {
  value = aws_eip.lb
}

resource "aws_s3_bucket" "mys3" {
  bucket = "terraform-demo-001-ZT"
}

output "mys3bucket" {
  value = aws_s3_bucket.mys3
}