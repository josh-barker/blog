resource "null_resource" "upload_blog" {
  provisioner "local-exec" {
    command = "aws s3 sync ${var.blog_source_path} s3://${local.bucket_name}"
  }
}
