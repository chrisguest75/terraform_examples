
locals {
  threshold_hours        = 10
}

data "tls_certificate" "endpoint" {
  url = var.url

  lifecycle {
    postcondition {
      # check validity is within the threshold
      condition     = !provider::assert::expired(timeadd(self.certificates[0].not_after, "-${local.threshold_hours}h")) 
      error_message = "${self.url} is not valid"
    }
  }
}

check "certificate_validity_check" {
  data "tls_certificate" "check_endpoint" {
    url          = var.url
    verify_chain = true
  }

  assert {
    # check validity is within the threshold
    condition     = !provider::assert::expired(timeadd(data.tls_certificate.check_endpoint.certificates[0].not_after, "-${local.threshold_hours}h"))
    error_message = "Certificate needs to be renewed"
  }
}

output "data_tls_certificate_endpoint_output" {
  value = data.tls_certificate.endpoint.certificates[0]
}
