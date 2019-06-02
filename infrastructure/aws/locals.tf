locals {
  workspace_name = "${replace(terraform.workspace, "blog-", "")}"
  sub_domain = "${workspace_name == "master" ? "" : "${local.workspace_name}."}"

  root_domain_name = "${local.sub_domain}${var.root_domain}"

  www_domain = "www.${local.root_domain_name}"
  bucket_name = "${local.www_domain}"

  enable_cdn = "${local.sub_domain == "" ? 1 : 0}"

  default_tags = {
    Branch = "${local.workspace_name}"
  }
}
