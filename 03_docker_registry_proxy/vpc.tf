locals {

}

resource "aws_vpc" "tf_registry_vpc" {
    cidr_block       = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name

    tags = merge(
        {
        "tf_resource" = format("%s", "tf_registry_vpc")
        },
        var.tags,
        var.repo_tags
    )
}

resource "aws_subnet" "tf_registry_subnet" {
    vpc_id = aws_vpc.tf_registry_vpc.id
    cidr_block = lookup(var.availability_zones, var.single_zone) 
    map_public_ip_on_launch = "false" //it makes this a public subnet
    availability_zone = var.single_zone

    tags = merge(
        {
        "tf_resource" = format("%s", "tf_registry_subnet")
        },
        var.tags,
        var.repo_tags
    )
}
