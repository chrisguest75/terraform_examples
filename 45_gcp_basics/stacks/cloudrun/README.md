# CLOUDRUN

TODO:

* Confirm ARM support on GCP cloudrun

## Roles

The terraform service account needs the following roles.  

```sh
# create artifact registries
gcloud projects add-iam-policy-binding $PROJECT_ID --member="serviceAccount:terraform@${PROJECT_ID}.iam.gserviceaccount.com" --role="roles/artifactregistry.admin"
```

## Test image

```sh
docker run --rm -it --platform linux/amd64 nginx bash


gcloud auth configure-docker europe-west2-docker.pkg.dev


docker tag nginx:latest europe-west2-docker.pkg.dev/terraform-testing-467115/terraform-testing-cube/nginx:latest

# this pushes ARM image
docker push europe-west2-docker.pkg.dev/terraform-testing-467115/terraform-testing-cube/nginx:latest
```

## Resources

* https://cloud.google.com/run/docs/deploying#images
* https://cloud.google.com/run/docs/building/containers#buildpacks
* https://cloud.google.com/functions/docs/reference/iam/roles
