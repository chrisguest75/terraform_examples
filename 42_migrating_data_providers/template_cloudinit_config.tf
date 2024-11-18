data "template_cloudinit_config" "userdata" {
  part {
    content_type = "text/cloud-config"

    content = <<EOF
repo_update: true
repo_upgrade: all

packages:
- htop
runcmd:
- systemctl enable named
- systemctl start  named
EOF
  }

  part {
    content_type = "text/x-shellscript"
    filename     = "init.sh"

    content = <<EOF
echo "Setting up ECS agent..."
EOF
  }

  part {
    content_type = "text/x-shellscript"
    filename     = "aws-inspector.sh"

    content = <<EOF
#!/usr/bin/env bash
set -o xtrace
EOF
  }
}
