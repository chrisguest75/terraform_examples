variable "project_id" {
  default     = ""
  type        = string
  description = "Name of the project"
}

variable "credentials_file" {
  default     = ""
  type        = string
  description = "Location of the credentials file"
}

variable "state_bucket_name" {
  default     = ""
  type        = string
  description = "Name of the state bucket"
}

variable "labels" {
  default     = {}
  type        = map(any)
  description = "Labels to be applied to resources"
}

variable "region" {
  default     = ""
  type        = string
  description = "Function region"

  validation {
    condition     = can(regex("^(europe-west2)$", var.region))
    error_message = "region must be 'europe-west2'"
  }
}

variable "resource_prefix" {
  default     = ""
  type        = string
  description = "Prefix resources with this string"
}
