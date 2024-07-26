# CONFIGURE CODE ARTIFACT

Example of creating and configuring codeartifact.  

## Prepare

```sh
export AWS_PROFILE=myprofile
export AWS_REGION=us-east-1
aws s3 ls
```

## Start

```sh
# initialise
just init

# plan
just plan

# apply
just apply

# destroy
just destroy
```

## Resources

* hashicorp/terraform-provider-aws repo [here](https://github.com/hashicorp/terraform-provider-aws)  
* Provides a CodeArtifact Repository Resource. [here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/codeartifact_repository)
