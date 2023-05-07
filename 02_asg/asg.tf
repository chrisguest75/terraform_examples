
resource "aws_key_pair" "deployer" {
  key_name   = "chrisguest-ssh-key"
  public_key = var.ssh_public_key
}


resource "aws_autoscaling_policy" "instances_autoscaling_policy" {
  name                   = "instances_autoscaling_policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.instances_autoscaling_group.name
}

# https://www.terraform.io/docs/providers/aws/r/autoscaling_group.html
resource "aws_autoscaling_group" "instances_autoscaling_group" {
  #vpc_zone_identifier  = ["subnet-2183ec69"]

  availability_zones = var.availability_zones
  name               = "instances_autoscaling_group"
  max_size           = 1
  min_size           = 1
  launch_template = {
    id      = "${aws_launch_template.instances_launch_template.id}"
    version = "$$Latest"
  }
  tag {
    key                 = "Name"
    value               = "AutoScaled"
    propagate_at_launch = true
  }
  tag {
    key                 = "Initialized"
    value               = "false"
    propagate_at_launch = true
  }
}

# https://www.terraform.io/docs/providers/aws/r/launch_template.html
resource "aws_launch_template" "instances_launch_template" {
  name_prefix                          = "instances_launch_template-"
  image_id                             = var.ami
  instance_type                        = "t2.micro"
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