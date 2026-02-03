# create an cloud instance
# where we want to creat it > cloud provider
# Which reigion

provider "aws" {
    region = "eu-west-1"
}

# which resource

resource "aws_instance" "app_instance" {

    # which AMI ID ami-0c1c30571d2dae5c9 (for ubuntu 22.04 lts)
    ami = "ami-0c1c30571d2dae5c9"

    # what type of instance to launch
    instance_type = "t3.micro"

    # please add a public ip to this instance
    associate_public_ip_address = true

    # name the service
    tags = {
        Name = "tech517-ozair-terraform-app"
        Env = "Testing"
    }
}

# specify the image
# security group (optional)
# type of instance
# need a public IP or not
# Order doesnt matter but better for readablity (terraform looks at full code and then proceeds)
# name the instance

# NEVER DO THIS:
#   aws_access_key = xxxxxxxxxx
#   aws_secret_key = xxxxxxxxxx

