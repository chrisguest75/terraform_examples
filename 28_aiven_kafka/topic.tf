# Topic for Kafka
resource "aiven_kafka_topic" "sample_topic" {
  project      = var.aiven_project_name
  service_name = aiven_kafka.kafka.service_name
  topic_name   = var.kafka_topic_name
  partitions   = 1
  replication  = 2
  config {
    retention_bytes = 1000000000
  }
}