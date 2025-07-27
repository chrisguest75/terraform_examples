# GCP BASICS

Create some basic GCP resources in a project.  

TODO:

* Set tags on firestore
* Does API enable require a depends_on

## Basics

```sh
brew info gcloud-cli

gcloud auth

gcloud projects list
```

## Get Credentials

```sh
export PROJECT_ID=terraform-testing-xxxxx

gcloud --project ${PROJECT_ID} iam service-accounts list

# create servcie account
gcloud --project ${PROJECT_ID} iam service-accounts create terraform --description="Terraform admin" --display-name="Terraform Admin"

# get credentials for service account
gcloud --project ${PROJECT_ID} iam service-accounts keys create terraform-sa.json --iam-account=terraform@${PROJECT_ID}.iam.gserviceaccount.com

# add permissions to manage storage
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com" --role="roles/storage.admin"

# terraform requires service usage
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com" --role="roles/serviceusage.serviceUsageAdmin"

# firestore owner
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com" --role="roles/datastore.owner"

# terraform requires resource manager API
gcloud services enable cloudresourcemanager.googleapis.com  --project=${PROJECT_ID}
```

## Creation

NOTE: You must create the state bucket first.  

```sh
just init state_bucket  

just plan state_bucket

just apply state_bucket
```

## Firestore

```sh
just init firestore  

just plan firestore

just apply firestore
```

## Resources

* https://cloud.google.com/firestore/native/docs/locations
* https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
