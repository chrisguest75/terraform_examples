

data "http" "endpoint" {
  url = var.url

  lifecycle {
    postcondition {
      condition     = provider::assert::http_success(self.status_code) 
      error_message = "${self.url} returned an unhealthy status code"
    }
  }
}

check "http_health_check" {
  data "http" "check_endpoint" {
    url = var.url
  }

  assert {
    condition     = provider::assert::http_success(data.http.check_endpoint.status_code)
    error_message = "${data.http.check_endpoint.url} returned an unhealthy status code"
  }
}
