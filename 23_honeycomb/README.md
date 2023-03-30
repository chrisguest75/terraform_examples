# HONEYCOMB PROVIDER

Demonstrate how to use the honeycomb provider.  

## Reason

Simply add the terraform provider and always specify -replace to create the marker.  

## Create

```sh
set -a
. ./.env
set +a

terraform init

terraform plan

# the dataset needs to have data
export TF_VAR_dataset="03_simple_express_b"

TF_VAR_marker_text=$(git rev-parse --short=10 HEAD) terraform apply -auto-approve   

# second trigger does not create
TF_VAR_marker_text=$(git rev-parse --short=10 HEAD) terraform apply -auto-approve   

# third trigger with replace
TF_VAR_marker_text=$(git rev-parse --short=10 HEAD) terraform apply -auto-approve -replace honeycombio_marker.marker
```

## Troubleshooting

```sh
TF_LOG_PROVIDER=debug terraform apply -auto-approve
```

## Resources

* honeycombio provider [here](https://registry.terraform.io/providers/honeycombio/honeycombio/0.13.1)  
* honeycombio/terraform-provider-honeycombio [here](https://github.com/honeycombio/terraform-provider-honeycombio)  
