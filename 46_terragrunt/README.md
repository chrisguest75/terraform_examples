# TERRAGRUNT

Demonstrate some terrgrunt basics.  

## Notes

* The shared module should not have a `terragrunt.hcl` file.  
* There is a `--log-format bare`

## Terminology

* Unit

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

## Just

```sh
just apply-all
```

## Resources

* https://terragrunt.gruntwork.io/docs/getting-started/quick-start/
* https://github.com/gruntwork-io/terragrunt
