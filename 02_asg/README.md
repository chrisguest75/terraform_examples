# README

Example of creating an Auto Scaling Group 

## Prepare

```sh
aws s3 ls
aws ec2 describe-instances --region eu-west-1 --output text
```

## Keys

Create and add keys (you can push them to keybase).  

```sh
ssh-keygen -f ./example_ssh 
export TF_VAR_ssh_public_key=$(cat example_ssh.pub) 
```

## Start

```sh
terraform init
terraform plan
terraform apply --auto-approve
terraform destroy
```

## Testing

```sh
aws --region eu-west-1 ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId]"  --filter "Name=tag:Name,Values=AutoScaled"
```

Terminate the instances and they should be respawned  

```sh
aws --region eu-west-1 ec2 terminate-instances --instance-ids
```

## SSH

```sh
ssh -i ./example_ssh ec2-user@$(aws --region eu-west-1 ec2 describe-instances --query "Reservations[*].Instances[*].[PublicIpAddress]"  --filter "Name=tag:Name,Values=AutoScaled" | jq ".[0][0][0]" --raw-output)
```

```sh
ssh -i /keybase/team/chris_test_team/aws_ssh_example/example_ssh 
```
