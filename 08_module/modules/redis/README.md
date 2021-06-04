## Requirements

| Name | Version |
|------|---------|
| terraform | =0.13.7 |
| docker | 2.12.1 |

## Providers

| Name | Version |
|------|---------|
| docker | 2.12.1 |

## Modules

No Modules.

## Resources

| Name |
|------|
| [docker_container](https://registry.terraform.io/providers/kreuzwerker/docker/2.12.1/docs/resources/container) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| image | n/a | `string` | `"redis:6.2.4-alpine"` | no |

## Outputs

| Name | Description |
|------|-------------|
| id | id of the running container |
