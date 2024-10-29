# MOCKING

Demonstrate mocking resources and data for modules.  

The example simulates reading a value from SSM to determine a bucket name.  

## Run

```sh
# still have to init
just init

# run tests
just terraform_extra_args="--verbose" test

# the plan will fail if you are not authenticated.  
just plan
just apply
```

## Resources

- Mocks [here](https://developer.hashicorp.com/terraform/language/tests/mocking)
