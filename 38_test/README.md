# TERRAFORM TEST

Demonstrate the new terraform testing features.  

NOTES:

* Tests have to be in a folder `tests` by default
* Unit tests are `command = plan`
* Integration tests are `command = apply`
* End to end tests are with `checks`

TODO:

* command = Apply
* Mocking

Reasons:

* When we create resources we usually have policies for tagging and naming conventions.  
* Modules can remove defaults and change naming conventions that maybe being depended on.  

## Run

```sh
# still have to init
just init

# run tests
just test

just plan
just apply
```

## Extra

```sh
# verbose and json output
just terraform_extra_args="-verbose -json" test | jq .
```

## Resources

* Write Terraform Tests [here](https://developer.hashicorp.com/terraform/tutorials/configuration-language/test0
* Testing HashiCorp Terraform [here](https://www.hashicorp.com/blog/testing-hashicorp-terraform)
* Terraform 1.7 adds test mocking and config-driven remove [here](https://www.hashicorp.com/blog/terraform-1-7-adds-test-mocking-and-config-driven-remove)
* https://developer.hashicorp.com/terraform/tutorials/configuration-language/checks