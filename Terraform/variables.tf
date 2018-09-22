variable "region" {
  default = "us-east-1"
}
variable "AmiLinux" {
  type = "map"
  default = {
    us-east-1 = "ami-04681a1dbd79675a5"
  }
}
variable "key_name" {
  default = "web-test-key"
  description = "The ssh key to use in the web instance(s)"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "disk_size" {
  default = 8
}
variable "count" {
  default = 3
}
variable "vpc-fullcidr" {
    default = "172.28.0.0/16"
  description = "the vpc cdir"
}
variable "Subnet-Public-AzA-CIDR" {
  default = "172.28.0.0/24"
  description = "the cidr of the subnet"
}
variable "Subnet-Private-AzA-CIDR" {
  default = "172.28.3.0/24"
  description = "the cidr of the subnet"
}

variable "Subnet-Private-AzB-CIDR" {
  default = "172.28.4.0/24"
  description = "the cidr of the subnet"
}
variable "mysql_password" {}