# CLOUDRUN

TODO:

* Confirm ARM support on GCP cloudrun

## Roles

The terraform service account needs the following roles.  

```sh
# create artifact registries
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com" --role="roles/artifactregistry.admin"

# Requires run.admin to deploy public endpoint as we add a policy.
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com" --role="roles/run.admin"
```

## Test image

```sh
docker run --rm -it --platform linux/amd64 nginx bash
```

## Resources

* https://cloud.google.com/run/docs/deploying#images
* https://cloud.google.com/run/docs/building/containers#buildpacks
* https://cloud.google.com/functions/docs/reference/iam/roles
* https://medium.com/terraform-using-google-cloud-platform/terraform-for-gcp-how-to-create-cloud-run-service-5c76bb77100c
