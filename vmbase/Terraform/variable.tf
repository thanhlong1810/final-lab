variable "ami_id" {
  description = "AMI id to lauch instance"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
  default     = null
}

variable "vpc_id" {
  description = "The VPC ID to launch in"
  type        = string
  default     = null
}
