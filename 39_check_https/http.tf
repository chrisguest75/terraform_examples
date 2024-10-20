

data "http" "endpoint" {
  url = var.url

  lifecycle {
    postcondition {
      condition     = self.status_code == 200
      error_message = "${self.url} returned an unhealthy status code"
    }
  }
}

check "http_health_check" {
  data "http" "check_endpoint" {
    url = var.url
  }

  assert {
    condition     = data.http.check_endpoint.status_code == 200
    error_message = "${data.http.check_endpoint.url} returned an unhealthy status code"
  }
}
