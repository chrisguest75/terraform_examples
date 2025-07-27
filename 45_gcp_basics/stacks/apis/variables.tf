variable project_id {
    default = ""
    type = string
    description = "Name of the project"    
}

variable credentials_file {
    default = ""
    type = string
    description = "Location of the credentials file"    
}

variable state_bucket_name {
    default = ""
    type = string
    description = "Name of the state bucket"    
}

variable "labels" {
    default = {}
    type = map
    description = "Labels to be applied to resources"
}

