# BUILD PROVIDER

Build a provider and use it.  

NOTES:

* Be careful with building against musl and using on glibc platform.  

TODO:

* Create a simple standalone provider.  

## Build and Run

```sh
just docker-shell

# inside the container
terraform init

terraform plan
```

## Resources

* Terraform Plugin SDKv2 [here](https://developer.hashicorp.com/terraform/plugin/sdkv2?in=terraform%2Fproviders)