variable "default_aws_region" {
  default = "eu-west-1"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "app_ami_id" {
  description = "Ubuntu 22.04 LTS"
  default     = "ami-017e6b553a59ae72e"
}

variable "db_ami_id" {
  description = "Ubuntu 22.04 LTS"
  default     = "ami-062a39530b9c8eb37"
}

variable "key_name" {
  default = "tech517-ozair-aws"
}

variable "node_js_port" {
  default = 3000
}

variable "mongodb_port" {
  default = 27017
}

