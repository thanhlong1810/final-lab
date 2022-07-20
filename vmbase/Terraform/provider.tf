provider "aws" {
}

locals {
  name   = "ec2-exercises"

  tags = {
    Owner       = "Long Tran"
    Environment = "Dev"
    Service     = "SSH"
  }
}

