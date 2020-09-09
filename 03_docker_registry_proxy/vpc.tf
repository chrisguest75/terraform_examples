locals {

}

resource "aws_vpc" "tf_registry_vpc" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = "true" #gives you an internal domain name
  enable_dns_hostnames = "true" #gives you an internal host name

  tags = merge(
    {
      "tf_resource" = format("%s", "tf_registry_vpc"),
      "Name" = "tf_registry_vpc" 
    },
    var.tags,
    var.repo_tags
  )
}

resource "aws_subnet" "tf_registry_subnet" {
  vpc_id                  = aws_vpc.tf_registry_vpc.id
  cidr_block              = lookup(var.availability_zones, var.single_zone)
  map_public_ip_on_launch = "false" //it makes this a public subnet
  availability_zone       = var.single_zone

  tags = merge(
    {
      "tf_resource" = format("%s", "tf_registry_subnet"),
      "Name" = "tf_registry_subnet" 
    },
    var.tags,
    var.repo_tags
  )
}


resource "aws_vpc_peering_connection" "tf_registry_peering" {
  peer_vpc_id = aws_vpc.tf_registry_vpc.id
  vpc_id      = var.default_vpc_id
  auto_accept = true

  tags = merge(
    {
      "tf_resource" = format("%s", "tf_registry_peering"),
      "Name" = "tf_registry_peering" 
    },
    var.tags,
    var.repo_tags
  )
}

resource "aws_security_group" "peering_default_to_registry_sg" {
  name        = "peering_default_to_registry_sg"
  description = "Allow connection to registry"
  vpc_id      = var.default_vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.private_cidr]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.private_cidr]
  }

  ingress {
    description = "ICMP"
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = [var.private_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = merge(
    {
      "tf_resource" = format("%s", "peering_default_to_registry_sg"),
      "Name" = "peering_default_to_registry_sg" 
    },
    var.tags,
    var.repo_tags
  )
}

resource "aws_security_group" "peering_registry_to_default_sg" {
  name        = "peering_registry_to_default_sg"
  description = "Allow connection to default"
  vpc_id      = aws_vpc.tf_registry_vpc.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.private_cidr]
  }

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.private_cidr]
  }

  ingress {
    description = "ICMP"
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = [var.private_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = merge(
    {
      "tf_resource" = format("%s", "peering_registry_to_default_sg"),
      "Name" = "peering_registry_to_default_sg"      
    },
    var.tags,
    var.repo_tags
  )
}

resource "aws_route" "route_default_to_registry" {
  route_table_id            = var.default_vpc_route_table_id
  destination_cidr_block    = var.vpc_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.tf_registry_peering.id
}


resource "aws_main_route_table_association" "tf_registry_route_association" {
  vpc_id         = aws_vpc.tf_registry_vpc.id
  route_table_id = aws_route_table.tf_registry_vpc_routetable.id
}

resource "aws_route_table" "tf_registry_vpc_routetable" {
  vpc_id = aws_vpc.tf_registry_vpc.id

  route {
    cidr_block                = var.default_vpc_cidr
    vpc_peering_connection_id = aws_vpc_peering_connection.tf_registry_peering.id
  }

  #route {
  #  cidr_block = var.vpc_cidr
  #}

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf_registry_vpc_internet_gateway.id
  }

  tags = merge(
    {
      "tf_resource" = format("%s", "tf_registry_vpc_routetable"),
      "Name" = "tf_registry_vpc_routetable"
    },
    var.tags,
    var.repo_tags
  )
}

resource "aws_internet_gateway" "tf_registry_vpc_internet_gateway" {
  vpc_id = aws_vpc.tf_registry_vpc.id

  tags = merge(
    {
      "tf_resource" = format("%s", "tf_registry_vpc_internet_gateway"),
      "Name" = "tf_registry_vpc_internet_gateway"
    },
    var.tags,
    var.repo_tags
  )
}

resource "aws_eip" "tf_registry_vpc_nat_ip" {
  vpc = false

  tags = merge(
    {
      "tf_resource" = format("%s", "tf_registry_vpc_nat_ip"),
      "Name" = "tf_registry_vpc_nat_ip"
    },
    var.tags,
    var.repo_tags
  )  
}

resource "aws_nat_gateway" "tf_registry_vpc_nat_gateway" {
  allocation_id = aws_eip.tf_registry_vpc_nat_ip.id
  subnet_id     =  aws_subnet.tf_registry_subnet.id

  tags = merge(
    {
      "tf_resource" = format("%s", "tf_registry_vpc_nat_gateway"),
      "Name" = "tf_registry_vpc_nat_gateway"
    },
    var.tags,
    var.repo_tags
  )
}

