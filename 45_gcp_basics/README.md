# GCP BASICS

Create a storage bucket in a project.  

## Basics

```sh
brew info gcloud-cli

gcloud auth

gcloud projects list
```

## Get Credentials

```sh
export PROJECT_ID=terraform-testing-467115 

gcloud --project ${PROJECT_ID} iam service-accounts list

gcloud --project ${PROJECT_ID} iam service-accounts create terraform --description="Terraform admin" --display-name="Terraform Admin"

gcloud --project ${PROJECT_ID} iam service-accounts keys create terraform-sa.json --iam-account=terraform@${PROJECT_ID}.iam.gserviceaccount.com
```

## Creation

```sh
just init

just plan

just apply
```

## Resources
