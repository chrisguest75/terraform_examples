# README

Import a docker container resource.  

## Start

```sh
# start a container make note of id and add to imports.  
docker run -d --rm redis:6.2-alpine
```

## Import

```sh
# create
just init

just plan 

docker ps -a --no-trunc

just plan 

rm ./generated.tf  
terraform plan -generate-config-out=generated.tf   

# cleanup
just clean
docker stop $(docker ps -aq)
```

## Resources
