FROM ubuntu:16.04

ENV PACKAGE=""

RUN apt-get update && apt-get install --no-install-recommends bash build-essential -y \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

WORKDIR /packages

ENTRYPOINT ["/bin/bash", "-c", "dpkg-scanpackages . | gzip -c9  > ./Packages.gz"]

