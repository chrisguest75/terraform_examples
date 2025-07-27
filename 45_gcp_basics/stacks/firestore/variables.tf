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

variable firestore_location {
    default = ""
    type = string
    description = "Firestore location"  

    validation {
        condition = can(regex("^(eur3|nam5|nam7)$", var.firestore_location))
        error_message = "firestore_location must be either 'eur3', 'nam5' or 'nam7"
    }      
}