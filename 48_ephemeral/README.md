# EPHEMERAL RESOURCES

Create an ephemeral resource and check the state file.  

NOTES:

* Ephemral resources only work on write-only fields.  

## Example

```sh
just init non-ephemeral 
just init ephemeral 

just apply non-ephemeral 
just apply ephemeral 
```

## Resources

* https://developer.hashicorp.com/terraform/language/resources/ephemeral
https://developer.hashicorp.com/terraform/language/ephemeral