# CHECK HTTPS

It possible to use checks to validate responses and certificates.  

NOTES:

- It doesn't seem as though you can fail an apply based on a failed check. It will only warn.  
- You can use lifecycle postconditions though.
- It's not possible to get the latency of the request.  

TODO:

- Check CORS?

## Checks

```sh
# still have to init
just init

just plan

just apply
```

## Results

The results of the requests in the checks are stored in the state file.  

```sh
terraform state list

# show state
terraform state show data.tls_certificate.check_endpoint
```

## Resources

- Use checks to validate infrastructure [here](https://developer.hashicorp.com/terraform/tutorials/configuration-language/checks)
- HTTP Provider [here](https://registry.terraform.io/providers/hashicorp/http/latest/docs)
- TLS Provider [here](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/data-sources/certificate)
- Time Provider [here](https://registry.terraform.io/providers/hashicorp/time/latest/docs)
- Simplifying assertions in Terraform using provider-defined functions [here](https://www.hashicorp.com/blog/simplifying-assertions-in-terraform-using-provider-defined-functions)
- Assert Provider [here](https://registry.terraform.io/providers/hashicorp/assert/latest/docs?product_intent=terraform)
