resource "aws_acm_certificate" "default" {
  count = local.enable_cdn

  domain_name = local.root_domain_name

  # TF-UPGRADE-TODO: In Terraform v0.10 and earlier, it was sometimes necessary to
  # force an interpolation expression to be interpreted as a list by wrapping it
  # in an extra set of list brackets. That form was supported for compatibility in
  # v0.11, but is no longer supported in Terraform v0.12.
  #
  # If the expression in the following list itself returns a list, remove the
  # brackets to avoid interpretation as a list of lists. If the expression
  # returns a single list item then leave it as-is and remove this TODO comment.
  subject_alternative_names = [local.www_domain]
  validation_method         = "DNS"
}

data "aws_route53_zone" "external" {
  name = "joshbarker.com.au."
}

resource "aws_route53_record" "cert_validation" {
  count = local.enable_cdn

  name    = aws_acm_certificate.default[0].domain_validation_options[0].resource_record_name
  type    = aws_acm_certificate.default[0].domain_validation_options[0].resource_record_type
  zone_id = data.aws_route53_zone.external.zone_id
  records = [aws_acm_certificate.default[0].domain_validation_options[0].resource_record_value]
  ttl     = "60"
}

resource "aws_route53_record" "cert_validation_alt1" {
  count = local.enable_cdn

  name    = aws_acm_certificate.default[0].domain_validation_options[1].resource_record_name
  type    = aws_acm_certificate.default[0].domain_validation_options[1].resource_record_type
  zone_id = data.aws_route53_zone.external.id
  records = [aws_acm_certificate.default[0].domain_validation_options[1].resource_record_value]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "default" {
  count = local.enable_cdn

  certificate_arn = aws_acm_certificate.default[0].arn

  validation_record_fqdns = [
    aws_route53_record.cert_validation[0].fqdn,
    aws_route53_record.cert_validation_alt1[0].fqdn,
  ]
}

