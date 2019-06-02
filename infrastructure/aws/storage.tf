resource "aws_s3_bucket" "www" {
  bucket = "${local.www_domain}"

  acl = "public-read"

  force_destroy = true

  tags = "${local.default_tags}"

  policy = <<POLICY
{
  "Version":"2012-10-17",
  "Statement":[
    {
      "Sid":"AddPerm",
      "Effect":"Allow",
      "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::${local.www_domain}/*"]
    }
  ]
}
POLICY

  website {
    index_document = "index.html"
    error_document = "404.html"
  }
}
