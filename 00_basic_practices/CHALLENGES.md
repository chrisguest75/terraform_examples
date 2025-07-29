# CHALLENGES

* Drift
  * Having manually applied changes being noticed as state changes.  
* Provider version changes
  * Manually applying changes with new providers. Breaking pipelines on older state.  
* AWS API changes
  * S3 bucket changes meant that upgrading a major version changed S3 resource behaviour. Moving out parameter blocks into resources.  
* Workspaces vs tfvars
  * Which way is better?
* Refactoring
  * Moving state from modules or into modules.
* Sensitive data
  * Sensitive data will be stored in state files. You can encrypt the file at rest, but with read access the data contained is visible.
  * Ephemeral resources can be applied to writable attributes
* Locks
  * Killing the terraform process can leave the lock attached.
* Tags
  * Cost Tagging
  * Some tag changes require a resource recreation
