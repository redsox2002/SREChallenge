variable "region" {
  default = "us-east-1"
}
variable "AmiLinux" {
  type = "map"
  default = {
    us-east-1 = "ami-4fffc834"
    us-east-2 = "ami-ea87a78f"
    us-west-1 = "ami-3a674d5a"
    us-west-2 = "ami-aa5ebdd2"
    ca-central-1 = "ami-5ac17f3e"
    eu-west-1 = "ami-ebd02392"
    eu-central-1 = "ami-657bd20a"
    eu-west-2 = "ami-489f8e2c"
    ap-southeast-1 = "ami-fdb8229e"
    ap-southeast-2 = "ami-30041c53"
    ap-northeast-2 = "ami-8663bae8"
    ap-northeast-1 = "ami-4af5022c"
    ap-south-1 = "ami-d7abd1b8"
    sa-east-1 = "ami-d27203be"
  }
}
variable "key_name" {
  default = "nginx-test-key"
  description = "The ssh key to use in the nginx instance(s)"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "disk_size" {
  default = 8
}
variable "count" {
  default = 1
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
