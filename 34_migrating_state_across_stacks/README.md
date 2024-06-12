# MIGRATING STATE

Move state from one stack to another.  

NOTES:

* The file provider does not support import so we use the docker provider.
* Removed block requires the lifecycle block
* At the moment the docker container requires a redeploy and does not directly import

## Deploy Stack 1

Create the files. Step 1 commented in.  

```sh
cd 34_migrating_state/stack1
terraform init

terraform apply
```

## Get state of stack 1

```sh
# list state for created files 
terraform state list

# show individual details
terraform state show 'module.files.local_file.files["1.txt"]'

terraform state show 'module.my_redis.docker_container.container'
```

## Plan Stack 2

Open a new window.  

```sh
cd 34_migrating_state/stack2
terraform init

# it will want to create the files
terraform plan

# now uncomment the import blocks (step2)

# although files do not support import blocks the docker provider does
terraform plan
```

## Detach Stack 1

By running the removed block we detach from the resource.

```sh
# Remove the comments around removed block
terraform apply
```

## Attach Stack 2

By running the import block we attach to the resource.

```sh
# Remove the comments around import blocks and change the id if required
terraform apply
```

## Resources

* local_file (Resource) [here](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)
* Generating configuration (import block) [here](https://developer.hashicorp.com/terraform/language/import/generating-configuration)
* Resource Blocks (removed block) [here](https://developer.hashicorp.com/terraform/language/resources/syntax)
