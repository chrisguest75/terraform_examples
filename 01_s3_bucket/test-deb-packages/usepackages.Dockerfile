FROM ubuntu:16.04

RUN echo "deb [trusted=yes] http://test-conde-deb-packages.s3-website-eu-west-1.amazonaws.com/ ./" | tee -a /etc/apt/sources.list > /dev/null 

RUN apt-get update && apt-get install bash hello-world -y \ 
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN which hello-world.sh
RUN hello-world.sh

ENTRYPOINT ["/bin/bash", "-c", "hello-world.sh"]

