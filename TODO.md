# TODO

* Migrate state across workspaces - to remove workspaces...
  * terraform state pull
  * terraform init -migrate-state
* terraform provider cache.  


* New terraform variable validations https://mattias.engineer/blog/2024/terraform-variable-cross-validation/
* Make a manifest of which pipelines to run and include it into the pipeline definition
* add automatic plans as comments. https://github.com/dflook/terraform-github-actions/tree/main/terraform-plan
* lifecycle {
    ignore_changes = ["*"]
  }
* build a provider
* Keybase
* GCP
* S3 bucket - deb repository
* security checking
* cost calculation
* OPA
* secrets
https://github.com/ContainerSolutions/terraform-examples/tree/main/aws/aws_eks/fargate/spot_and_fargate
https://github.com/zackproser/quake-in-fargate
https://itnext.io/creating-an-ecs-fargate-service-for-container-applications-using-terraform-and-terragrunt-2af5db3b35c0

https://github.com/ContainerSolutions/terraform-examples

* testing - https://github.com/GoogleCloudPlatform/terraform-python-testing-helper
* terraspace example
* Optional, precondition, postcondition - https://brendanthompson.com/posts/2022/06/post-terraform-v1-features-i-love

Examples:

* Create a resource using for-each.  Migrate state over to a new reource and remove entry from for-each.

https://github.com/awslabs/terraform-iam-policy-validator

- https://registry.terraform.io/providers/hashicorp/assert/latest/docs
- https://registry.terraform.io/providers/hashicorp/external/latest/docs/data-sources/external 