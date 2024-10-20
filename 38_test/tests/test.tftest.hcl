variables {
  services = {
    "service_0" = {
      kind = "tcp"
      node = "ip-10-0-0-0"
    },
    "service_1" = {
      kind = "http"
      node = "ip-10-0-0-1"
    },
    "service_2" = {
      kind = "tcp"
      node = "ip-10-0-0-2"
    },
  }
}
 
run "get_tcp_services" {
  variables {
    service_kind = "tcp"
  }
 
  command = plan
 
  assert {
    condition     = jsondecode(local_file.ip_addresses.content) == ["10.0.0.0", "10.0.0.2"]
    error_message = "Parsed `tcp` services should return 2 IP addresses, 10.0.0.0 and 10.0.0.2"
  }
 
  assert {
    condition     = local_file.ip_addresses.filename == "./out/tcp.hcl"
    error_message = "Filename should include service kind `tcp`"
  }
}
 
run "get_http_services" {
  variables {
    service_kind = "http"
  }
 
  command = plan
 
  assert {
    condition     = jsondecode(local_file.ip_addresses.content) == ["10.0.0.1"]
    error_message = "Parsed `http` services should return 1 IP address, 10.0.0.1"
  }
 
  assert {
    condition     = local_file.ip_addresses.filename == "./out/http.hcl"
    error_message = "Filename should include service kind `http`"
  }
}
