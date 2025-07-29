# CERTIFICATION

* Multicloud
* Backends
  * State files - configured in init
  * Locks - dynamodb is deprecated, use_lockfile
  * Ensure bucket versioning is enabled
* Providers
  * Multiple providers use aliases.  
  * Lock files - can use init -upgrade if constraints allow upgrade
  * max_retries can be set on the provider
* Resources
  * Lifecycle
    * create_before_destroy
    * prevent_destroy
    * ignore_changes
    * replace_triggered_by
    * precondition - check ami is an x86 image
* Meta arguments
  * for_each - each.key and each.value
* Import Block- import --generate
* Moved Block - refactoring
* Removed Block - requires lifecycle destroy = false
* Modules
  * versioning by git commit
  * validation on variables
* CLI options
  * Validate Configuration
  * Refresh
* Drift and Refresh Only
* Data Sources
  * Can use shared state for global resources that don't change often.
* Secret Management
  * Vault
  * Use secrets manager as a data source
* Builtin Functions and Datatypes
* Resource Graph
* HCP
* Sentinal
* Test
  
## Notes

* Ephemeral Resources - https://developer.hashicorp.com/terraform/language/resources/ephemeral 
  * Secrets that will be thrown away.  

## Resources

* https://developer.hashicorp.com/terraform/tutorials/certification-003/associate-review-003