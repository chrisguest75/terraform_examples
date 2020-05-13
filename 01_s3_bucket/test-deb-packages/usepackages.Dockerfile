FROM ubuntu:16.04

ARG REPOSITORY_URL=
RUN echo "deb [trusted=yes] ${REPOSITORY_URL} debian Packages" | tee -a /etc/apt/sources.list > /dev/null 
# returns http://test-conde-deb-packages.s3-website-eu-west-1.amazonaws.com/dists/debian/Packages/binary-amd64/Packages  404  Not Found

RUN apt-get update && apt-get install bash hello-world -y \ 
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN which hello-world.sh
RUN hello-world.sh

ENTRYPOINT ["/bin/bash", "-c", "hello-world.sh"]

