# SNIPPETS

## Ternary

```terraform
var.condition_met ? "value_if_true" : "value_if_false"

var.bool == true ? "value_if_true" : "value_if_false"
```

## Data Structures

```terraform
locals {
    resources = {
    workspace1    = {
        name1 = "this is a resource name1"
    }
    workspace2    = {
        name1 = "this is a resource name1"
        name2 = "this is a resource name2"
    }
    workspace3    = {
        name1 = "this is a resource name1"
    }
  }
}

resources[terraform.workspace]["name1"]
resources[terraform.workspace]["name2"]
```

## Resources
