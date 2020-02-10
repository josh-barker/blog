resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.external.zone_id
  name    = local.www_domain
  type    = "A"

  alias {
    name = local.enable_cdn == 1 ? element(
      concat(
        aws_cloudfront_distribution.www_distribution.*.domain_name,
        [""],
      ),
      0,
    ) : aws_s3_bucket.www.website_domain
    zone_id = local.enable_cdn == 1 ? element(
      concat(
        aws_cloudfront_distribution.www_distribution.*.hosted_zone_id,
        [""],
      ),
      0,
    ) : aws_s3_bucket.www.hosted_zone_id
    evaluate_target_health = local.enable_cdn == 1 ? true : false
  }
}

