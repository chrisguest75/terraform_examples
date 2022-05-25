# README

Example of creating an S3 Bucket

## NOTES

* You can update the packages and rerun terraform and it will upload the new packages.  

## TODO  

* https://github.com/MayaraCloud/apt-transport-s3
* https://manpages.debian.org/testing/apt-transport-s3/apt-transport-s3.8.en.html
* https://manpages.debian.org/jessie/apt/sources.list.5.en.html
* https://s3.eu-west-1.amazonaws.com/test-conde-deb-packages
* Might need to remove ./ from packages.gz manifest.

## Prepare

```sh
aws s3 ls
```

## Build .deb Examples

Build the image to build the packages and index  

```sh
cd test-deb-packages 
docker build -t debianbuilder -f build.Dockerfile . 
```

Build the debian package in Docker

```sh
mkdir packages
docker run -it -v=$(pwd):/packages debianbuilder --action=build -p=hello-world -o=./packages/   
```

## Build Packages.gz

```sh
docker run -it -v=$(pwd):/packages debianbuilder --action=package -p=packages
zmore ./Packages.gz    

# Add --debug to it if you want to check paths in index
docker run -it -v=$(pwd):/packages debianbuilder --action=package -p=packages --debug
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
BUCKET_NAME=$(terraform output -json | jq '.s3_url.value | sub("http://"; "") | split(".")[0]' --raw-output)
open ${URL}  
curl ${URL}
curl ${URL}/packages/hello-world_1.0_all.deb
curl --output - ${URL}/packages/hello-world_1.0_all.deb | xxd
curl ${URL}/debian/Packages.gz
aws s3api list-objects --bucket ${BUCKET_NAME}
```

## Use packages

```sh
docker build --build-arg=REPOSITORY_URL=${URL} --build-arg=PREINSTALL=true -t usepackages --no-cache -f ./test-deb-packages/usepackages.Dockerfile .
```

## Cleanup

```sh
terraform destroy
```

## Troubleshooting

```sh
# Turn off package install 
docker build --build-arg=REPOSITORY_URL=${URL}/debian --build-arg=PREINSTALL=false -t usepackages --no-cache -f ./test-deb-packages/usepackages.Dockerfile .

# 
docker run -it --entrypoint=/bin/bash usepackages

docker run -it --entrypoint=/bin/bash ubuntu:16.04 
```
