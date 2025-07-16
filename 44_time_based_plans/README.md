# TIME BASED PLANS

Have an array of parameters that are decided based on the time of the day.  

TODO:

* Check how some resources behae with this kind of controlled state change.  

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

* https://registry.terraform.io/providers/hashicorp/time/latest/docs