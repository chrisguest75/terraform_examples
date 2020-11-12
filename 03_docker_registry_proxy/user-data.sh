#!/bin/sh
##### Instance ID captured through Instance meta data #####
InstanceID=`/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id`
##### Set a tag name indicating instance is not configured ####
aws ec2 create-tags --region $EC2_REGION --resources $InstanceID --tags Key=Initialized,Value=false
##### Install Ansible ######
yum update -y
yum install git  -y
yum install docker -y 
systemctl start docker
curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py"
python /tmp/get-pip.py
pip install pip --upgrade
rm -fr /tmp/get-pip.py
pip install boto
pip install --upgrade ansible

mkdir code
cd code

cat << EOF > config-quay.yml
version: 0.1
log:
    fields:
        service: registry
storage:
    cache:
        blobdescriptor: inmemory
    filesystem:
        rootdirectory: /var/lib/registry
http:
    addr: :5000
    headers:
        X-Content-Type-Options: [nosniff]
health:
    storagedriver:
        enabled: true
        interval: 10s
        threshold: 3

proxy:
    remoteurl: https://quay.io
    username: <username>
    password: <password>
EOF

mkdir images
docker run -d -p 80:5000 --restart=always -v $(pwd)/images:/var/lib/registry -v $(pwd)/config-quay.yml:/etc/docker/registry/config.yml --name registry registry:2


