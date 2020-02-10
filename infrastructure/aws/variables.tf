variable "branch" {
  default = "master"
}

variable "root_domain" {
  default = "joshbarker.com.au"
}

variable "blog_source_path" {
  description = "Path for where the blog exists"
  default = ""
}

variable "aws_access_key" {
  description = "Access key"
}

variable "aws_secret_key" {
  description = "Secret key"
}