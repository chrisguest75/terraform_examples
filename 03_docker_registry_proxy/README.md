# README.md
[INCOMPLETE] Demonstrate how to build a docker registry proxy in terraform.

## TODO
1. An ec2 instance to support docker registry
1. An s3 bucket to support images
1. An ALB?  
1. A docker client to test pulls.  
1. Anisble provisioner?


## Keys
Create and add keys (you can push them to keybase).  

```
ssh-keygen -f ./example_ssh 
export TF_VAR_ssh_public_key=$(cat example_ssh.pub) 
```

## SSH to registry
```sh
ssh-agent 
ssh-add <keys>
ssh -A -t <user@machine1> ssh <user@machine2>
ssh-add -l
```