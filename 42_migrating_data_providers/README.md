# MIGRATING PROVIDERS

Test how terraform handles state when migrating providers.  

Here I use the old archived `template` provider to then migrate to the replacement `cloudinit` provider.  

NOTES:

* terraform handles the migration of the state between the providers with no guidance.  
* It automatically detects the state of the data object should be assigned to the cloudinit provider.  
* It will apply with no changes even though the provider has changed in the state file.  

## Run

Two stages for the test.  

### Step 1 - deploy template

```sh
just init

just plan
just apply

# check provider
cat ./state/terraform.tfstate
```

### Step 2 - switch to cloudinit

```sh
# rename cloudinit_config.skiptf to cloudinit_config.tf
# and template_cloudinit_config.skiptf to template_cloudinit_config.tf

# still have to init to switch providers 
just init -upgrade

just apply

# check new provider
cat ./state/terraform.tfstate
```

## Resources

