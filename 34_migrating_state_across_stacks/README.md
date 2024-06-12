# MIGRATING STATE

Move state from one stack to another.  

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

## Deploy Stack 2

Open a new window.  

```sh
cd 34_migrating_state/stack2
terraform init

# it will want to create the files
terraform plan

# now uncomment the import blocks (step2)

# although files do not support import blocks
terraform plan
```

## Resources

* local_file (Resource) [here](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file)
* Generating configuration (import block)[here](https://developer.hashicorp.com/terraform/language/import/generating-configuration)
* https://developer.hashicorp.com/terraform/language/resources/syntax