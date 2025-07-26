# TERRAGRUNT

Demonstrate some terrgrunt basics.  

## Install

```sh
brew info tgenv

brew install tgenv

tgenv install 0.83.2
```

## Initialise

You need to add a `terragrunt.hcl` to each stack

## Apply

```sh
cd example_local_file
terragrunt apply -auto-approve

terragrunt apply -auto-approve -var content='Hello, Terragrunt!'

# NOTE: Still need content to destroy.
terragrunt destroy -auto-approve -var content='Hello, Terragrunt!'
```

## Resources

* https://terragrunt.gruntwork.io/docs/getting-started/quick-start/
