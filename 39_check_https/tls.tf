
locals {
  timestamp_now       = provider::time::rfc3339_parse(timestamp()).unix
  timestamp_threshold = provider::time::rfc3339_parse(timeadd(timestamp(), "240h")).unix
}

data "tls_certificate" "endpoint" {
  url = var.url

  lifecycle {
    postcondition {
      condition     = local.timestamp_threshold < provider::time::rfc3339_parse(self.certificates[0].not_after).unix
      error_message = "${self.url} is not valid"
    }
  }
}

check "certificate_health_check" {
  data "tls_certificate" "check_endpoint" {
    url          = var.url
    verify_chain = true
  }

  assert {
    condition     = local.timestamp_threshold < provider::time::rfc3339_parse(data.tls_certificate.check_endpoint.certificates[0].not_after).unix
    error_message = "${data.tls_certificate.check_endpoint.url} is not valid"
  }
}

output "timestamp_now_output" {
  value = local.timestamp_now
}

output "timestamp_threshold_output" {
  value = local.timestamp_threshold
}

output "data_tls_certificate_endpoint_output" {
  value = data.tls_certificate.endpoint.certificates[0]
}
