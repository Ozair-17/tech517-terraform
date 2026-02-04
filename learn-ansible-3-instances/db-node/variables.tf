variable "default_aws_region" {
  default = "eu-west-1"
}

variable "instance_type" {
  default = "t3.micro"
}


variable "key_name" {
  description = "AWS key pair name (same as controller and app-node)"
  default     = "tech517-ozair-aws"
}

variable "mongodb_port" {
  description = "MongoDB default port"
  default     = 27017
}
