provider "aws" {
    region = "us-east-1"
}

provider "aws" {
    alias = "east_2"
    region = "us-east-2"
}