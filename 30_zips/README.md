# README

Demonstrate `zip` generation techniques for Terraform.  

## Techniques

| Technique | Pros | Cons |
|---|---|---|
| `archive_file` resoure   | Simple | Cannot control how the zips are built |
|                          | Automatically generates hashes | Paths cannot be rebased |
| provisioner `local-exec` | Makes it harder to be platform agnostic | Functions like `filebase64sha256` seem to get evaluated before resources |

## Archive

Generates an archive from content, a file, or directory of files.  

```sh
terraform init

terraform apply 

unzip -l ../out/archive.zip
```

## Provisioner

The local-exec provisioner invokes a local executable after a resource is created. This invokes a process on the machine running Terraform, not on the resource. See the remote-exec provisioner to run commands on the resource.  

Important: Use provisioners as a last resort. There are better alternatives for most situations.  

```sh
terraform init

rm -rf ../out
terraform apply
terraform apply --target "null_resource.zip_files"

unzip -l ../out/provisioner.zip
```

## Resources

* archive_file (Data Source) [here](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file#nestedblock--source)
* raymondbutcher/terraform-archive-stable [repo](https://github.com/raymondbutcher/terraform-archive-stable)
* local-exec Provisioner [here](https://developer.hashicorp.com/terraform/language/resources/provisioners/local-exec)  
