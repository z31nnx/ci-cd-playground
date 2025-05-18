# Tags 
variable "tags" {
  type = map(string)
}

variable "ec2_name" {}
variable "instance_types" {
  type = map(string)
  default = {
    "web" = "t3.micro"
  }
}