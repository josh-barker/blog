resource "aws_s3_bucket_object" "object" {
  bucket = "${aws_s3_bucket.www.id}"

  key    = "index.html"
  source = "files/index.html"

  content_type = "text/html"

  etag = "${filemd5("files/index.html")}"
}
