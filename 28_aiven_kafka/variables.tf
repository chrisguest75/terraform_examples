
variable "aiven_project_name" {
  type = string
}

variable "aiven_api_token" {
  type = string
}

variable "cloud_name" {
  type = string
}

variable "service_name" {
  type = string
}

variable "kafka_topic_name" {
  type = string
}

variable "kafka_user_name" {
  type        = string
  description = "The kafka user name."
  default     = "kafka_a"
}