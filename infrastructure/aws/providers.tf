provider "aws" {
  version = "~> 2.9"
  region  = "us-east-1"

  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

provider "tfe" {
  version = "0.11.4"
}