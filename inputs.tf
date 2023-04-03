variable "region" { 
    type = string
    default = "ap-south-1"
  
}
variable "vpc_name" { 
    default = "my_nitervpc"
  
}
variable "cidr_block" {
    default = "10.10.0.0/16"
  
}
variable "subnet_cidr" { 
    type = list(string)

  
}
variable "subnet_cidr_private" {
    type = list(string)
  
}
variable "azs" {
    type = list(string)
  
}
variable "ami-id" {
    type = string
    description = "AMI id of ubbuntu system" 
    default = "ami-02eb7a4783e7e9317"
  
}
variable "web-trigger" {
    type = string
    description = "running number for trigger"
    default = "1.0"
}