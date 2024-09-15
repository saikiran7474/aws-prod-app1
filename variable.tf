variable "aws-vpc-app1" {
    type = string
    default = "10.1.0.0/16"
  }
variable "aws-public-subnet1-app1" {
    type = string
  }
variable "aws-private-subnet1-app1" {
    type = string
  }
variable "aws-public-subnet2-app1" {
    type = string
  } 
variable "aws-private-subnet2-app1" {
    type = string
  }
  variable "region"{
    type = string
  } 
  variable "AZ-1"  {
    type = string
  }
  variable "AZ-2"  {
    type = string
  }
  variable "instance_type" {
    type = string
  }
  variable "ami" {
    type = string
  }
  variable "key_name" {
    type = string
  }