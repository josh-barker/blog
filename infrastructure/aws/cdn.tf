resource "aws_cloudfront_distribution" "www_distribution" {
  count = "${local.enable_cdn}"

  origin {
    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "http-only"
      origin_ssl_protocols   = ["SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"]
    }

    domain_name = "${aws_s3_bucket.www.website_endpoint}"
    origin_id   = "${local.www_domain}"
  }

  enabled             = true
  default_root_object = "index.html"

  default_cache_behavior {
    viewer_protocol_policy = "redirect-to-https"
    compress               = true
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]

    target_origin_id = "${local.www_domain}"
    min_ttl          = 0
    default_ttl      = 86400
    max_ttl          = 31536000

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  aliases = ["${local.www_domain}"]

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  price_class = "PriceClass_All"

  viewer_certificate {
    acm_certificate_arn = "${aws_acm_certificate_validation.default.certificate_arn}"
    ssl_support_method  = "sni-only"
  }

  tags = "${local.default_tags}"
}
