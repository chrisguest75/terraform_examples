## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | >=2.12.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_docker"></a> [docker](#provider\_docker) | >=2.12.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [docker_container.container](https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image"></a> [image](#input\_image) | The image:tag to use for the container. | `string` | `"redis:6.2.4-alpine"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the container | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | id of the running container |
| <a name="output_name"></a> [name](#output\_name) | name of the running container |
| <a name="output_pathmodule"></a> [pathmodule](#output\_pathmodule) | Output the path of the module |
