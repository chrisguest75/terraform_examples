
# Validate that the zone is legitimate
variable "zone" {
    type = string
    description = "Zone"

    validation {
        condition = lookup(local.legal_aws_zones, var.zone, false)  == true
        #condition = "us-east-1a" == var.zone
        error_message = "zone is not in legal list of zones"
    }
}

# check string exists in an array
variable "environment_name" {
    type = string
    description = "Environment name"

    validation {
        condition = contains(local.legal_environment_names, var.environment_name)  == true
        #condition = "us-east-1a" == var.zone
        error_message = "environment_name is not in legal list"
    }
}

# check tags are in a valid list
variable "tags" {
  type = map(string)
  description = "Tags"

  validation {
    condition = can({
      for key, value in var.tags :
      key => contains(local.legal_tag_names, key)
    })
    error_message = "Tags are not in the legal list of tag names"
  }
}

# check string matches regex
variable "service_name" {
    type = string
    description = "Service name"

    validation {
        condition = can(regex(local.legal_service_name_regex, var.service_name))
        error_message = "service_name does not match regex"
    }
}