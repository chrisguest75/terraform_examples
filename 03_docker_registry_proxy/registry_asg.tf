
locals {
  tags_asg_format = null_resource.tags_as_list_of_maps.*.triggers
  repo_tags_asg_format = null_resource.repo_tags_as_list_of_maps.*.triggers
}

resource "null_resource" "tags_as_list_of_maps" {
  count = length(keys(var.tags))

  triggers = {
    "key"                 = keys(var.tags)[count.index]
    "value"               = values(var.tags)[count.index]
    "propagate_at_launch" = "true"
  }
}

resource "null_resource" "repo_tags_as_list_of_maps" {
  count = length(keys(var.repo_tags))

  triggers = {
    "key"                 = keys(var.repo_tags)[count.index]
    "value"               = values(var.repo_tags)[count.index]
    "propagate_at_launch" = "true"
  }
}


resource "aws_autoscaling_policy" "instances_autoscaling_policy" {
    name = "instances_autoscaling_policy"
    scaling_adjustment = 1
    adjustment_type = "ChangeInCapacity"
    cooldown = 300
    autoscaling_group_name = aws_autoscaling_group.instances_autoscaling_group.name
}


# https://www.terraform.io/docs/providers/aws/r/launch_template.html
resource "aws_launch_template" "instances_launch_template" {
    name_prefix = "instances_launch_template_"
    image_id      = var.ami
    instance_type = "t2.micro"
    instance_initiated_shutdown_behavior = "stop"
    key_name = aws_key_pair.deployer.key_name
    vpc_security_group_ids = [aws_security_group.peering_registry_to_default_sg.id]    
    block_device_mappings {
        device_name = "/dev/xvda"
        ebs {
            volume_size = 40
            volume_type = "gp2"
        }
        #delete_on_termination = true
    }
    placement {
        availability_zone = var.single_zone
    }    
    #ebs_optimized = true
    #monitoring {
    #    enabled = true
    #}
    user_data = base64encode(file("user-data.sh"))

    tags = merge(
        {
        "tf_resource" = format("%s", "instances_launch_template")
        },
        var.tags,
        var.repo_tags
    )    
}

# https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html
resource "aws_autoscaling_group" "instances_autoscaling_group" {
    vpc_zone_identifier  = [aws_subnet.tf_registry_subnet.id]

    name                      = "instances_autoscaling_group"
    max_size                  = 1
    min_size                  = 1
    launch_template  {
       id      = aws_launch_template.instances_launch_template.id
       version = "$Latest"
    }

    tags = concat(
        [
        {
            "key"                 = "Name"
            "value"               = "AutoScaled"
            "propagate_at_launch" = true
        },
        {
            "key"                 = "Initialized"
            "value"               = "false"
            "propagate_at_launch" = true
        },        
        ],
        local.tags_asg_format,
        local.repo_tags_asg_format,
    )
}

