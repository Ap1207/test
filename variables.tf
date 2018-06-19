variable "env_name" {
  default = "env-stage"
}
variable "app_name" {
  default = "SonarQube"
}
variable "vpc_id" {
  default =  ""
}

# values for AWS Provider
variable "aws_access_key" {
  default = "fgsdgfdfsgfdsg"
}
variable "aws_secret_key" {
  default = "etwrtertrtewr"
}
variable "region" {
  default = "some_region"
}

# Values for EC2 instance

variable "ami_id" {
  default = "ami-7c491f05"
}
variable "instance_type" {
  default = "t2.medium"
}
variable "key_name" {
  default = ""
}
variable "private_ip" {
  default = ""
}
variable "associate_public_ip" {
  default = true
}
variable "subnet" {
  default = ""
}

# Security group

variable "ports" {
  type = "list"
  default = [22, 80]
}
variable "cidr" {
  type = "list"
  default = ["1.1.1.1/12", "2.2.2.2/16"]
}

variable "proto" {
  type = "list"
  default = ["tcp"]
  description = "Protocol name for the firewall rule tcp/upd"
}
