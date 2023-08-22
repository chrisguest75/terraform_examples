# TFSEC

TODO:

* Show how to use a rego policy

## Install

```sh
brew install tfsec

tfsec --help
```

## Run

```sh
cd $(git root)

# run a report on whole repo
tfsec

tfsec --concise-output

# detects missing tags
tfsec ./01_s3_bucket --custom-check-dir ./31_tfsec/checks --tfvars-file ./01_s3_bucket/terraform.tfvars
```


## Resources

* tfsec is a static analysis security scanner for your Terraform code. [here](https://aquasecurity.github.io/tfsec/)
* aquasecurity/tfsec repo [here](https://github.com/aquasecurity/tfsec)  

* question: Help with custom check definition #158 https://github.com/aquasecurity/tfsec/issues/1580

* https://aquasecurity.github.io/tfsec/v1.28.1/guides/rego/rego/
