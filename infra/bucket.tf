resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "henrylawson.net"
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::henrylawson.net-production/*"]

    principals {
      type        = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.origin_access_identity.iam_arn}"]
    }
  }
}

resource "aws_s3_bucket" "s3_bucket" {
   bucket = "henrylawson.net-production"
   acl = "private"
   policy = "${data.aws_iam_policy_document.s3_policy.json}"
}

resource "aws_iam_server_certificate" "cert" {
  name = "henrylawson.net-production"
  certificate_body = "${file("../ssl/2016-03-12/www_henrylawson_net.crt")}"
  certificate_chain = "${file("../ssl/2016-03-12/fullchain.pem.gitcrypt")}"
  private_key = "${file("../ssl/2016-03-12/privkey.key.gitcrypt")}"
  path = "/cloudfront/henrylawsonnet/"
}

resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = "${aws_s3_bucket.s3_bucket.bucket}.s3.amazonaws.com"
    origin_id   = "S3-${aws_s3_bucket.s3_bucket.bucket}"

    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path}"
    }
  }

  enabled             = true
  comment             = "henrylawson.net"
  default_root_object = "index"
  aliases             = ["henrylawson.net"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${aws_s3_bucket.s3_bucket.bucket}"
    compress         = true

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    default_ttl            = 3600

    min_ttl                = 0
    max_ttl                = 31536000
  }

  price_class = "PriceClass_All"

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  custom_error_response {
    error_code = "404"
    error_caching_min_ttl = "360"
    response_code = "404"
    response_page_path = "/errors/not_found"
  }

  custom_error_response {
    error_code = "403"
    error_caching_min_ttl = "360"
    response_code = "403"
    response_page_path = "/errors/not_found"
  }

  tags {
    Environment = "production"
  }

  viewer_certificate {
    iam_certificate_id = "${aws_iam_server_certificate.cert.id}"
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1"
  }
}

resource "aws_route53_zone" "henrylawson" {
  name = "henrylawson.net"
}

resource "aws_route53_record" "root" {
  zone_id = "${aws_route53_zone.henrylawson.zone_id}"
  name = "henrylawson.net"
  type = "A"

  alias {
    name = "${aws_cloudfront_distribution.s3_distribution.domain_name}"
    zone_id = "${aws_cloudfront_distribution.s3_distribution.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "keybase" {
  zone_id = "${aws_route53_zone.henrylawson.zone_id}"
  name = "henrylawson.net"
  type = "TXT"
  ttl = "5"
  records = ["keybase-site-verification=yQ3pkNN338azY9m8cXQv8Qbna1X9JDgNUo6IOvp78mM"]
}
