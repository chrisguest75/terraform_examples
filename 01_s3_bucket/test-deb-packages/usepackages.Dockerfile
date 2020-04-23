FROM ubuntu:16.04

ARG REPOSITORY_URL=
ARG PREINSTALL=true
RUN echo "deb [trusted=yes] ${REPOSITORY_URL} /" | tee -a /etc/apt/sources.list > /dev/null 

# Do not clean out package caches so I can play with the image.
RUN apt-get update && apt-get install bash -y
RUN apt search hello-world
RUN apt-cache show hello-world
RUN if [ "${PREINSTALL}" = "true" ]; then apt-get install hello-world -y; fi
RUN if [ "${PREINSTALL}" = "true" ]; then which hello-world.sh; fi
RUN if [ "${PREINSTALL}" = "true" ]; then hello-world.sh; fi

ENTRYPOINT ["/bin/bash", "-c", "hello-world.sh"]

