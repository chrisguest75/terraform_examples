variables {
  services = {
    "service_0" = {
      kind = "tcp"
      node = "ip-10-0-0-0"
    },
  }
}

run "file_exists" {
  variables {
    service_kind = "tcp"
  }
 
  command = apply
 
  assert {
    condition     = fileexists(local_file.ip_addresses.filename) 
    error_message = "File should exist"
  }

}
 
run "has_content" {
  variables {
    service_kind = "tcp"
  }

  command = apply
 
  assert {
    condition     = file(local_file.ip_addresses.filename) == "[\"10.0.0.0\"]" 
    error_message = "File should contain the correct content"
  }  
}

