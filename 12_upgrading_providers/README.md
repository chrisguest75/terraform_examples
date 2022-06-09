# README

Demonstrate how to upgrade terraform providers to newer versions  

ℹ️ NOTES:

* Use a controlled version of the providers.  
* Have a separate pipeline that works like `dependabot` to check for available upgrades.  
* The separate pipeline can perform a provider upgrade and plan.  
* If no plan differences exist a MR/PR can be created with the new `lock.hcl` file.  

## 🏠 Create initial state

```sh
# init the providers
terraform init

# plan and apply
terraform plan
terraform apply -auto-approve
```

## ⚡️ Change provider version

Modify the provider version.  

```tf
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~>2.16.0"
    }
  }
```

Planning will now fail with a version mismatch.  

```sh
# planning will now fail because of lock.hcl
terraform plan
```

```sh
# upgrade the provider and create a new lock.hcl file.  
terraform init -upgrade

# now plan and apply will work
terraform plan
terraform apply -auto-approve
```

## 👀 Resources

* best-practices-for-provider-versions [here](https://www.terraform.io/language/providers/requirements#best-practices-for-provider-versions)  
* dependency-lock [here](https://www.terraform.io/language/files/dependency-lock)  
* version-constraints [here](https://www.terraform.io/language/expressions/version-constraints)  
