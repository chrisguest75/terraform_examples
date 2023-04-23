

output "kafka_service_uri" {
  value       = aiven_kafka.kafka.service_uri
  description = "URI for connecting to the service."
  sensitive   = true
}

output "kafka_service_host" {
  value       = aiven_kafka.kafka.service_host
  description = "The hostname of the service."
}

output "kafka_service_port" {
  value       = aiven_kafka.kafka.service_port
  description = "The port of the service."
}

output "kafka_service_username" {
  value       = aiven_kafka.kafka.service_username
  description = "Username used for connecting to the service."
}

output "kafka_service_password" {
  value       = aiven_kafka.kafka.service_password
  description = "Password used for connecting to the service."
  sensitive   = true
}

output "kafka_access_key" {
  value       = aiven_kafka.kafka.kafka[0].access_key
  description = "The Kafka client certificate key."
  sensitive   = true
}

output "kafka_access_cert" {
  value       = aiven_kafka.kafka.kafka[0].access_cert
  description = "The Kafka client certificate."
  sensitive   = true
}

output "kafka_connect_uri" {
  value       = aiven_kafka.kafka.kafka[0].connect_uri
  description = "The Kafka Connect URI."
  sensitive   = true
}

output "kafka_connect_host" {
  value       = aiven_kafka.kafka.components[1].host
  description = "The Kafka Connect host."
}

output "kafka_connect_port" {
  value       = aiven_kafka.kafka.components[1].port
  description = "The Kafka Connect port."
}

output "kafka_rest_uri" {
  value       = aiven_kafka.kafka.kafka[0].rest_uri
  description = "The Kafka REST URI."
  sensitive   = true
}

output "kafka_rest_host" {
  value       = aiven_kafka.kafka.components[2].host
  description = "The Kafka REST host."
}

output "kafka_rest_port" {
  value       = aiven_kafka.kafka.components[2].port
  description = "The Kafka REST port."
}

/*# Topic for Kafka
output "sample_topic_id" {
  value       = aiven_kafka_topic.sample_topic.id
  description = "Resource's Terraform identifier."
}

# User for Kafka
output "kafka_a_id" {
  value       = aiven_kafka_user.kafka_a.id
  description = "Resource's Terraform identifier."
}

output "kafka_a_username" {
  value       = aiven_kafka_user.kafka_a.username
  description = "The actual name of the Kafka User."
}

output "kafka_a_password" {
  value       = aiven_kafka_user.kafka_a.password
  description = "The actual name of the Kafka User."
  sensitive   = true
}

output "kafka_a_access_key" {
  value       = aiven_kafka_user.kafka_a.access_key
  description = "Access certificate key for the user."
  sensitive   = true
}

output "kafka_a_access_cert" {
  value       = aiven_kafka_user.kafka_a.access_cert
  description = "Access certificate for the user."
  sensitive   = true
}

# ACL for Kafka
output "sample_acl_id" {
  value       = aiven_kafka_acl.sample_acl.id
  description = "Resource's Terraform identifier."
}*/