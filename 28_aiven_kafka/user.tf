# User for Kafka
resource "aiven_kafka_user" "kafka_a" {
  project      = var.aiven_project_name
  service_name = aiven_kafka.kafka.service_name
  username     = var.kafka_user_name
}

# ACL for Kafka
resource "aiven_kafka_acl" "sample_acl" {
  project      = var.aiven_project_name
  service_name = aiven_kafka.kafka.service_name
  username     = var.kafka_user_name
  permission   = "read"
  topic        = "*"
}

