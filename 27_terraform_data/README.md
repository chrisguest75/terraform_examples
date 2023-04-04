# README

Demonstrate the new `terraform_data` provider

## Install

```sh
tfenv install 1.4.4
tfenv use 1.4.4
```

```sh
terraform metadata functions -json | jq .

terraform workspace select -or-create

terraform_data
replace_triggered_by

ignore_changes

sensitive

# complex objects
variable "with_optional_attribute" {
  type = object({
    a = string                # a required attribute
    b = optional(string)      # an optional attribute
    c = optional(number, 127) # an optional attribute with a default value
  })
}

```

## Resources

https://github.com/hashicorp/terraform/releases