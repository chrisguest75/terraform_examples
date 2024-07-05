# EC2 GPU INSTANCE

Example of creating an instance with a GPU available.  

## Prepare

```sh
export AWS_PROFILE=myprofile
export AWS_REGION=eu-west-2
aws s3 ls
aws ec2 describe-instances --region eu-west-2 --output text

# ami
aws ssm get-parameters --names /aws/service/ecs/optimized-ami/amazon-linux-2/kernel-5.10/gpu/recommended --region eu-west-2
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
aws --region eu-west-2 ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId]"  --filter "Name=tag:Name,Values=gpu_ec2_instance"
```

Terminate the instances and they should be respawned  

```sh
aws --region eu-west-1 ec2 terminate-instances --instance-ids
```

## SSH

```sh
ssh -i ./example_ssh ec2-user@$(aws --region eu-west-1 ec2 describe-instances --query "Reservations[*].Instances[*].[PublicIpAddress]"  --filter "Name=tag:Name,Values=gpu_ec2_instance" | jq ".[0][0][0]" --raw-output)
```

## Resources

* hashicorp/terraform-provider-aws repo [here](https://github.com/hashicorp/terraform-provider-aws)  
* Instance Types [here](https://instances.vantage.sh/)
* AWS Deep Learning Base AMI (Amazon Linux 2)
 [here](https://aws.amazon.com/releasenotes/aws-deep-learning-base-ami-amazon-linux-2/)
* Release Notes for DLAMI [here](https://docs.aws.amazon.com/dlami/latest/devguide/appendix-ami-release-notes.html)
* Find an AMI [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/finding-an-ami.html)
* Using the Deep Learning Base AMI [here](https://docs.aws.amazon.com/dlami/latest/devguide/tutorial-base.html)
* Using a GPU workload AMI [here](https://docs.aws.amazon.com/batch/latest/userguide/batch-gpu-ami.html)

