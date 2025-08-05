# GCP BASICS

Create some basic GCP resources in a project.  

TODO:

* Set tags on firestore
* Does API enable require a depends_on
* Create a resricted user for firestore
* Add a basic gcp function

## Basics

```sh
brew info gcloud-cli

gcloud auth

gcloud projects list
```

## Get Credentials

The `terraform-sa.json` is loaded into the context of the provider so you can use a service account permissions.  
When adding roles to the service account it can take time.  

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

# firestore owner
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com" --role="roles/datastore.owner"

# cloudfunctions create
gcloud iam service-accounts add-iam-policy-binding \
  "${PROJECT_ID}@appspot.gserviceaccount.com" \
  --member="serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com" \
  --role="roles/iam.serviceAccountUser" \
  --project="${PROJECT_ID}"

gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com" --role="roles/cloudfunctions.developer"

# create artifact registries
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com" --role="roles/artifactregistry.admin"

# required for the service account to impersonate the cloudrun execution context.
gcloud iam service-accounts add-iam-policy-binding 187702371956-compute@developer.gserviceaccount.com --member="serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com" --role='roles/iam.serviceAccountUser' --project="${PROJECT_ID}"
```

## Creation

NOTE: You must create the state bucket first.  

```sh
just init state_bucket  

just plan state_bucket

just apply state_bucket
```

## Enable APIS

There are a few apis that need to be enabled.  

```sh
just init apis

just plan apis

just apply apis
```

## Firestore

```sh
just init firestore  

just plan firestore

just apply firestore
```

## Functions

```sh
just init functions  

just plan functions

just apply functions
```

## Resources

* https://cloud.google.com/firestore/native/docs/locations
* https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference
