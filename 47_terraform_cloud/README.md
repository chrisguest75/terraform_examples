# TERRAFORM CLOUD

Referred to as HCP Terraform.  

Goto: https://app.terraform.io/

TODO:

* How does it work with tfenv?
* Add some tests
* Add some policies.
* Add some secrets.

## CLI

The login tokens can be set to expire.  

```sh
# create login token and store in /Users/chrisguest/.terraform.d/credentials.tfrc.json
terraform login

# show credentials 
cat $HOME/.terraform.d/credentials.tfrc.json
```

## Actions

Once logged in the actions will be recorded and logs posted to HCP.  

NOTE: Before planning fill out the `cloud.tf.template`.  

```sh
terraform init

terraform plan

terraform apply
```

## Resources

* https://developer.hashicorp.com/terraform/tutorials/cloud-get-started/cloud-sign-up