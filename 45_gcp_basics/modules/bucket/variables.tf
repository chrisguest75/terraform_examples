variable bucket_name {
    default = ""
    type = string
    description = "Name of the bucket"    
}

variable location {
    default = ""
    type = string
    description = "Location of the bucket"    
}

variable "labels" {
    default = {}
    type = map
    description = "Labels to be applied to resources"
}