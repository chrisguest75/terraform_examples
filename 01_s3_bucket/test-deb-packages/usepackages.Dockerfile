FROM ubuntu:16.04

ARG REPOSITORY_URL=
ARG PREINSTALL=
#RUN echo "deb [trusted=yes] ${REPOSITORY_URL} ./" | tee -a /etc/apt/sources.list > /dev/null 
RUN echo "deb [trusted=yes] ${REPOSITORY_URL} debian Packages" | tee -a /etc/apt/sources.list > /dev/null 
# returns http://test-conde-deb-packages.s3-website-eu-west-1.amazonaws.com/dists/debian/Packages/binary-amd64/Packages  404  Not Found

# Do not clean out package caches so I can play with the image.
RUN apt-get update && apt-get install bash -y
RUN apt search hello-world
RUN apt-cache show hello-world
RUN if [ "${PREINSTALL}" = "true" ]; then apt-get install hello-world -y; fi
RUN if [ "${PREINSTALL}" = "true" ]; then which hello-world.sh; fi
RUN if [ "${PREINSTALL}" = "true" ]; then hello-world.sh; fi

ENTRYPOINT ["/bin/bash", "-c", "hello-world.sh"]

