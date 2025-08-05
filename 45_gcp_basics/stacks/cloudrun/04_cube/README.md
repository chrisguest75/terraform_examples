# TWISTER

Build an example of a twister.  

TODO:

* There seems to be a bug with public url and the image on nix. Navigate to http://localhost:1234/public/twister.png


## View from file

```sh
just nix

just install

just host
```

## Docker

```sh
docker run --rm -it -p 8080:80 --platform linux/amd64 nginx 

# build locally both arm and amd
just bake-build

just docker-run-amd64
# or
just docker-run-arm64

# quick test
curl -vvv 0.0.0.0:8080
```

## Push

```sh
# login into artifact registry
gcloud auth configure-docker europe-west2-docker.pkg.dev

set -a
. ../../../.env
set +a
just PROJECT_ID=${PROJECT_ID} bake-build-push     
```

## Resources

