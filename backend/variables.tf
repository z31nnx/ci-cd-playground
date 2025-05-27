variable "tags" {
  type = map(string)
  default = {
    "Environment" = "Dev"
    "Project"     = "Test"
    "Owner"       = "Bug"
    "ManagedBy"   = "Terraform"
  }
}