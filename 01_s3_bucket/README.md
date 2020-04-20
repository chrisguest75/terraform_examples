# README
Example of creating an S3 Bucket

## Prepare 
```sh
aws s3 ls
```

## Build Debian Packages

```sh
docker build -t builddeb -f builddeb.Dockerfile . 
docker run -it -e PACKAGE=hello-world -v=$(pwd):/packages builddeb
```

```sh
docker build -t buildpackages -f buildpackages.Dockerfile .
docker run -it -v=$(pwd):/packages buildpackages
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
docker build --build-arg=REPOSITORY_URL=http://test-conde-deb-packages.s3-website-eu-west-1.amazonaws.com/debian -t usepackages --no-cache -f usepackages.Dockerfile . 

## Cleanup
```sh
terraform destroy
```

## Troubleshooting 
 ```sh
docker run -it --entrypoint=/bin/bash ubuntu:16.04 
```
