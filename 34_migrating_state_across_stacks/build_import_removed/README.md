# BUILD IMPORT AND REMOVES

Simplify building import and removals when migrating modules between stacks.  

Finds the module and the names of all of the resources.  

```sh
mkdir -p ./out
terraform show --json > ./out/state_test.json
```

## Example

```sh
# extract module resources from state
jq -c '.values.root_module.child_modules[] | select(.address == "module.my_module") | .resources[] | { type: .type, address: .address, arn: .values.arn, id: .values.id, policy_arn: .values.policy_arn, role: .values.role }' ./out/state_test.json | jq -s > ./out/my_module.json

# build imports
MODULE_NAME="my_module" NEW_MODULE_NAME="my_new_module" gomplate -d jsonData=./out/my_module.json -f import.gomplate > ./out/my_module-import.tf

# build old removals
gomplate -d jsonData=./out/my_module.json -f remove.gomplate > ./out/my_module-remove.tf
```
