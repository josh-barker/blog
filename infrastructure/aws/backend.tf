terraform {
  backend "remote" {
    organization = "blog"

    workspaces {
      prefix = "blog-"
    }
  }
} 