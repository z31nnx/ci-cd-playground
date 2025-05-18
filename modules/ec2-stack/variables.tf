# Tags 
variable "tags" {
  type = map(string)
}

variable "ami_id" {
  type    = string
  default = "ami-09f4814ae750baed6"
}
variable "ec2_name" {}
variable "instance_types" {
  type = map(string)
  default = {
    "web" = "t3.micro"
  }
}