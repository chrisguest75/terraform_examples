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
terraform destroy
```

## Test

```sh
docker run -it --entrypoint=/bin/bash ubuntu:16.04 
docker build -t usepackages -f usepackages.Dockerfile .
```