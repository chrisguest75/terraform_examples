# README
Demonstrate how to import data from a webservice

## Create 

```sh
terraform init
terraform plan
terraform apply -auto-approve

curl 0.0.0.0:8080           
terraform output -json weather_data | jq -r .body | jq

open http://0.0.0.0:8080      
```

# Resources 
