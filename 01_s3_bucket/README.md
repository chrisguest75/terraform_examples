# README
Example of creating an S3 Bucket

## NOTES
* You can update the packages and rerun terraform and it will upload the new packages. 

## Prepare 
```sh
aws s3 ls
```

## Build Debian Packages

```sh
docker build -t builddeb -f ./test-deb-packages/builddeb.Dockerfile . 
docker run -it -e PACKAGE=hello-world -v=$(pwd)/test-deb-packages:/packages builddeb
```

```sh
docker build -t buildpackages -f ./test-deb-packages/buildpackages.Dockerfile .
docker run -it -v=$(pwd)/test-deb-packages:/packages buildpackages
```

## Start
```sh
terraform init
terraform plan
terraform apply --auto-approve
```

## Test
```sh
URL=$(terraform output -json | jq ".s3_url.value" --raw-output)
open ${URL}  
curl ${URL}
curl ${URL}/debian/hello-world.deb
curl ${URL}/debian/Packages.gz
```

## Use packages
docker build --build-arg=REPOSITORY_URL=${URL}/debian -t usepackages --no-cache -f ./test-deb-packages/usepackages.Dockerfile . 
## Cleanup
```sh
terraform destroy
```

## Troubleshooting 
 ```sh
docker run -it --entrypoint=/bin/bash ubuntu:16.04 
```
