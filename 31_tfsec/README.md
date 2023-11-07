# TFSEC

Demonstrate how to use `tfsec`  

TODO:

* Show how to use a rego policy
* The tag check example is not working correctly yet

## Install

```sh
brew install tfsec
# show install folder
ll -a $(brew --prefix tfsec)/bin

tfsec --help

# Get and link tfsec-checkgen
gh release list -R aquasecurity/tfsec
# download
gh release download v1.28.4 -R aquasecurity/tfsec --pattern tfsec-checkgen-darwin-amd64
mv ./tfsec-checkgen-darwin-amd64 $(brew --prefix tfsec)/bin/tfsec-checkgen

chmod +x /usr/local/opt/tfsec/bin/tfsec-checkgen
ln -s /usr/local/opt/tfsec/bin/tfsec-checkgen /usr/local/bin/tfsec-checkgen 
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

## Writing custom rules

```sh
# create a template
tfsec-checkgen generate 

tfsec-checkgen test-check ./checks/required_tags_tfchecks.yaml -p ./tests/aws_s3_bucket_success.tf -f ./tests/aws_s3_bucket_fail.tf

# validate rules
tfsec-checkgen validate ./checks/required_tags_tfchecks.yaml

# tests?
tfsec-checkgen test-check ./checks/required_tags_tfchecks.yaml -p ./tests/aws_s3_bucket_fail_notags.tf 
tfsec-checkgen test-check ./checks/required_tags_tfchecks.yaml -p ./tests/aws_s3_bucket_success.tf -f ./tests/aws_s3_bucket_fail.tf 
```

## Ignoring rules in code

```hcl
# You can add comments to to ignore rules 
# tfsec:ignore:aws-s3-no-public-access-with-acl
```

## Find all terraform in a repo

```sh
# find all files
MY_TF_DIRS=$(find "." -name "*.tf" | sed -r 's|/[^/]+$$||' | sort --unique)
# iterate and scan
while IFS=, read -r tfpath 
do
    echo "FOUND $tfpath"
    tfsec $tfpath --concise-output | grep "detected"
done < <(echo $MY_TF_DIRS)
```

## Resources

* tfsec is a static analysis security scanner for your Terraform code. [here](https://aquasecurity.github.io/tfsec/)
* aquasecurity/tfsec repo [here](https://github.com/aquasecurity/tfsec)  
* Custom Checks [here](https://aquasecurity.github.io/tfsec/v1.28.4/guides/configuration/custom-checks/)
* question: Help with custom check definition [#1580](https://github.com/aquasecurity/tfsec/issues/1580)
* Writing Custom Rego Policies [here](https://aquasecurity.github.io/tfsec/v1.28.1/guides/rego/rego/)  
