terraform {
  required_version = "~>1.4.4"

  required_providers {
    aiven = {
      source  = "aiven/aiven"
      version = ">=4.0.0, <5.0.0"
    }
  }

  backend "local" {
    path = "./state/terraform.tfstate"
  }
}

provider "aiven" {
  api_token = var.aiven_api_token
}

resource "aiven_kafka" "kafka" {
  project                 = var.aiven_project_name
  cloud_name              = var.cloud_name
  service_name            = var.service_name
  plan                    = "startup-2"
  maintenance_window_dow  = "wednesday"
  maintenance_window_time = "18:30:00"
  termination_protection  = false

  kafka {
  }

  kafka_user_config {
    kafka_version = "3.3"
    # not supported by free plan
    kafka_connect   = false
    kafka_rest      = true
    schema_registry = true

    kafka {
      auto_create_topics_enable    = true
      num_partitions               = 1
      default_replication_factor   = 2
      min_insync_replicas          = 2
      message_max_bytes            = 131072
      group_max_session_timeout_ms = 70000
      log_retention_bytes          = 1000000000
    }

    kafka_authentication_methods {
      certificate = true
    }
  }
}
