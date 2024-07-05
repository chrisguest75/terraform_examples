#!/bin/sh
##### Instance ID captured through Instance meta data #####
InstanceID=`/usr/bin/curl -s http://169.254.169.254/latest/meta-data/instance-id`
##### Set a tag name indicating instance is not configured ####
aws ec2 create-tags --region $EC2_REGION --resources $InstanceID --tags Key=Initialized,Value=false
##### Install Ansible ######
yum update -y
yum install git  -y
curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py"
python /tmp/get-pip.py
pip install pip --upgrade
rm -fr /tmp/get-pip.py
pip install boto
pip install --upgrade ansible