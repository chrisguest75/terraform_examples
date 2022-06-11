# README

Demonstrate how to use the CDK for Terraform.  

TODO:

* Add the unittests

## 📋 Prereqs

```sh
# NOTE: This seems to clash with tfenv
brew install cdktf

# check the global list of installed packages
npm list --global        
npm install --global cdktf-cli@latest

# check cdktf
cdktf
```

## 🏠 Install

```sh
# requires above 14.17.x
nvm use
npm install
```

## ⚡️ Deploy

```sh
# deploy the stack
cdktf deploy  

# check deployment
docker ps 
curl 0.0.0.0:8000   

# cleanup
cdktf deploy  
```

## 🏠 Creation

```sh
# create template
cdktf init --template=typescript --local
# add provider
npm install @cdktf/provider-docker   

# add the resources to ./main.ts
code ./main.ts
```

## 🧪 Testing

```sh
npm run test   
```

## 👀 Resources

* CDK for Terraform [here](https://www.terraform.io/cdktf)  
* Install CDK for Terraform and Run a Quick Start Demo [here](https://learn.hashicorp.com/tutorials/terraform/cdktf-install?in=terraform/cdktf)  
* cdktf-cli [here](https://www.npmjs.com/package/cdktf-cli)  
* hashicorp/terraform-cdk repo [here](https://github.com/hashicorp/terraform-cdk)  
* List of CDK providers [here](https://www.npmjs.com/~cdktf-team)  
* AWS example [here](https://learn.hashicorp.com/tutorials/terraform/cdktf-build)  
* Projen [here](https://github.com/projen/projen#getting-started)  

