# README

Demonstrate how to troubleshoot problems with Terraform  

NOTES:

* Check you have no unexpected TF_VAR variables set that are overriding values.  
* If need to upgrade change `.terraform-version` and `required_version = "=1.x.x"`  
* TIP: If you need to see a value coming from remote state just add it as an output and use plan or use a local-exec provisioner (demo in main.tf).  

## Locks

If an apply has failed or you have exited early. The lock may still be set.  

```sh
terraform unlock 5302b8d3-b301-d9cb-72f1-a3b1692c17c3
```

## Logging

TF_LOG_CORE and TF_LOG_PROVIDER
TF_LOG  

```sh
terraform init

# all logs at debug
export TF_LOG=debug  
terraform plan
unset TF_LOG

# core logs only at debug
export TF_LOG_CORE=debug  
terraform plan
unset TF_LOG_CORE

# provider logs only at debug
export TF_LOG_PROVIDER=debug
terraform plan
unset TF_LOG_PROVIDER

terraform apply -auto-approve
# rerun and recreate the output
terraform apply -replace "null_resource.debugging"

# capture all output in a file
terraform apply --auto-approve  2> >(awk '{print "stderr:" $0}') > >(awk '{print "stdout:" $0}') &> ./stdout_combined.txt
```

## Graph (graphviz)

From `terraform graph --help`  

Produces a representation of the dependency graph between different objects in the current configuration and state.

The graph is presented in the DOT language. The typical program that can read this format is GraphViz, but many web services are also available to read this format.

NOTE: The output can be rendered at [viz-js.com](http://viz-js.com/)  

```sh
# show the graph of the state
terraform graph
```

```sh
# install graphviz
brew info graphviz  

# output the svg from the graph using graphviz (use live-server extension to view)
terraform graph | dot -Tsvg > ./tf.svg 
```

## Console

From `terraform console --help`  

Starts an interactive console for experimenting with Terraform interpolations.  

This will open an interactive console that you can use to type interpolations into and inspect their values. This command loads the current state. This lets you explore and test interpolations before using them in future configurations.  

You may access resources in the state (if you have one) just as you would
from a configuration. For example: "aws_instance.foo.id" would evaluate
to the ID of "aws_instance.foo" if it exists in your state.  

NOTE: As you open the console you'll see a lock file being created `.terraform.tfstate.lock.info`  

```sh
# open console
terraform console

# false
contains(["hello"],"world") 

# true
contains(["hello"],"hello") 

# 12
max(5, 12, 9)

# load a json file
jsondecode(file("./files.json"))

# show a local variable
local.json_files

# does not seem possible to override values (errors)
local.json_files = jsondecode(file("./files.json"))

# get an element of an array
element(local.json_files.files, 0)

# pull out file name and compare
substr(element(local.json_files.files, 0).name, 0,5) == "file1"

# concat a array of strings
join(",", local.files_list[*].name)

# merge two maps
merge(var.tags, { "key3" = "value3" })
```

## Providers

From `terraform providers --help`  

Prints out a tree of modules in the referenced configuration annotated with their provider requirements.  

This provides an overview of all of the provider requirements across all referenced modules, as an aid to understanding why particular provider plugins are needed and why particular versions are selected.  

```sh
terraform providers
```

## Outputs

From `terraform output --help`  

Reads an output variable from a Terraform state file and prints the value. With no additional arguments, output will display all the outputs for the root module.  If NAME is not specified, all outputs are printed.  

```sh
terraform output
```

## Show state

From `terraform state list --help`  

List resources in the Terraform state.  

This command lists resource instances in the Terraform state. The address argument can be used to filter the instances by resource or module. If no pattern is given, all resource instances are listed.  

The addresses must either be module addresses or absolute resource   addresses, such as:

* aws_instance.example
* module.example
* module.example.module.child
* module.example.aws_instance.example

An error will be returned if any of the resources or modules given as filter addresses do not exist in the state.

```sh
terraform state list
```

## Resources

* Documentation [environment-variables](https://www.terraform.io/docs/cli/config/environment-variables.html)  
* About Graph Visualization [here](https://graphviz.org/about/)
* Graphviz Command Line
 [here](https://graphviz.org/doc/info/command.html)  
* Visualise graphviz in browser [viz-js.com](http://viz-js.com/)  
* Terraform inbuilt functions [here](https://www.terraform.io/language/functions)  
