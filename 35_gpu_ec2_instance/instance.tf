data "aws_ssm_parameter" "ami" {
  name = "/aws/service/ecs/optimized-ami/amazon-linux-2/kernel-5.10/gpu/recommended"
}

resource "aws_key_pair" "deployer" {
  key_name   = "chrisguest-ssh-key"
  public_key = var.ssh_public_key
}

resource "aws_vpc" "vpc" {
  cidr_block = "172.16.0.0/16"

  tags = merge(var.tags, {
    Name = "gpu_ec2_vpc"
  })
}

resource "aws_subnet" "subnet" {

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-west-2a"

  map_public_ip_on_launch = true

  tags = var.tags
}

# resource "aws_network_interface" "network_interface" {
#   subnet_id   = aws_subnet.subnet.id
#   private_ips = ["172.16.10.100"]

#   tags = var.tags
# }

resource "aws_security_group" "securitygroup" {
  name   = "gpu_ec2_sg"
  vpc_id = aws_vpc.vpc.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }

  # Terraform removes the default rule, so we re-add it.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = merge(var.tags, {
    Name = "gpu_ec2_gateway"
  })
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = merge(var.tags, {
    Name = "gpu_ec2_route_table"
  })
}

resource "aws_route_table_association" "route_table_association" {
  subnet_id      = aws_subnet.subnet.id
  route_table_id = aws_route_table.route_table.id
}

# https://www.terraform.io/docs/providers/aws/r/launch_template.html
resource "aws_launch_template" "instances_launch_template" {
  name_prefix                          = "instances_launch_template-"
  image_id                             = jsondecode(data.aws_ssm_parameter.ami.insecure_value).image_id
  instance_type                        = var.instance_type
  instance_initiated_shutdown_behavior = "stop"
  key_name                             = aws_key_pair.deployer.key_name
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 40
      volume_type = "gp2"
    }
    #delete_on_termination = true
  }
  #ebs_optimized = true
  #monitoring {
  #    enabled = true
  #}
  user_data = base64encode(file("user-data.sh"))
}

resource "aws_instance" "machine" {
  instance_type = var.instance_type

  launch_template {
    id = aws_launch_template.instances_launch_template.id
  }

  # network_interface {
  #   network_interface_id = aws_network_interface.network_interface.id
  #   device_index         = 0
  # }

  subnet_id = aws_subnet.subnet.id

  security_groups = [
    aws_security_group.securitygroup.id
  ]

  tags = merge(var.tags, {
    Name = "gpu_ec2_instance"
  })
}