variable "files" {
    type = list
}

variable "out_path" {
    type = string
}

variable "conditional_file_contents" {
    type = string
    default = "more contents"
}

variable "conditional" {
    type = number
    default = 0
}