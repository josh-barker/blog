resource "null_resource" "upload_blog" {
  count = "${var.blog_source_path != "" ? 1 : 0 }"

  provisioner "local-exec" {
    command = "aws s3 sync ${var.blog_source_path} s3://${aws_s3_bucket.www.id}"
  }
}
