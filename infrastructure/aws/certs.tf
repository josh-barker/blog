
resource "aws_acm_certificate" "default" {
  count = "${local.enable_cdn}"

  domain_name       = "${local.root_domain_name}"

  subject_alternative_names = ["${local.www_domain}"]
  validation_method = "DNS"
}

data "aws_route53_zone" "external" {
  name = "joshbarker.com.au."
}

resource "aws_route53_record" "cert_validation" {
  count = "${local.enable_cdn}"

  name    = "${aws_acm_certificate.default.domain_validation_options.0.resource_record_name}"
  type    = "${aws_acm_certificate.default.domain_validation_options.0.resource_record_type}"
  zone_id = "${data.aws_route53_zone.external.zone_id}"
  records = ["${aws_acm_certificate.default.domain_validation_options.0.resource_record_value}"]
  ttl     = "60"
}

resource "aws_route53_record" "cert_validation_alt1" {
  count = "${local.enable_cdn}"

  name    = "${aws_acm_certificate.default.domain_validation_options.1.resource_record_name}"
  type    = "${aws_acm_certificate.default.domain_validation_options.1.resource_record_type}"
  zone_id = "${data.aws_route53_zone.external.id}"
  records = ["${aws_acm_certificate.default.domain_validation_options.1.resource_record_value}"]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "default" {
  count = "${local.enable_cdn}"

  certificate_arn = "${aws_acm_certificate.default.arn}"

  validation_record_fqdns = [
    "${aws_route53_record.cert_validation.fqdn}",
    "${aws_route53_record.cert_validation_alt1.fqdn}",
  ]
}
