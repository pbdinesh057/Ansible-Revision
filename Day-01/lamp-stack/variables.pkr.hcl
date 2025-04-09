variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "source_ami" {
  type    = string
  default = "ami-0c02fb55956c7d316" # Amazon Linux 2
}

variable "ami_name_prefix" {
  type    = string
  default = "lamp-server"
}

variable "ssh_username" {
  type    = string
  default = "ec2-user"
}

variable "ami_owners" {
  type    = list(string)
  default = ["amazon"]
}
