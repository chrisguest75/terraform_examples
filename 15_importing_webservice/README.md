# README

Demonstrate how to import data from a webservice

## Create the weather site

```sh
terraform init
terraform plan
terraform apply -auto-approve

# extract the body response from the webservice  
terraform output -json weather_data | jq -r .body | jq

# get a response
curl http://0.0.0.0:8080

# open in a browser
open http://0.0.0.0:8080      
```

## Resources

* [dynamic-blocks](https://www.terraform.io/docs/language/expressions/dynamic-blocks.html)  
