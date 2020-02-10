# resource "null_resource" "upload_blog" {
#   count = var.blog_source_path != "" ? 1 : 0

#   triggers = {
#     build_number = timestamp()
#   }

#   provisioner "local-exec" {
#     command = "aws s3 sync ${var.blog_source_path} s3://${aws_s3_bucket.www.id}"
#   }
# }

resource "aws_s3_bucket_object" "blog" {
  for_each = fileset("../../", "blog/*")

  source = each.key
  etag   = filemd5(each.key)
}
