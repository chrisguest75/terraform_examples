
locals {
    legal_aws_zones = { 
        us-east-1a = true
        eu-west-1a = true
        eu-west-2a = true
    }

    legal_tag_names = [ 
        "GitRepoPath",
        "GitRepo",
        "AppId",
        "ServiceGroup"
    ]

    legal_environment_names = [ 
        "dev",
        "staging",
        "prod",
    ]

    legal_service_name_regex = "^(dev|prod)_[a-zA-Z]*_instance"
}