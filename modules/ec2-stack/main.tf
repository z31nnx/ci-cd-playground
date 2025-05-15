data "aws_ami" "amazon_linux_2_ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-*-x86_64-gp2"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


resource "aws_instance" "web" {
  ami               = data.aws_ami.amazon_linux_2_ami.image_id
  instance_type     = var.instance_types["web"]
  availability_zone = local.azs[count.index]
  count             = 2

  tags = merge(
    local.global_tags, {
      Name = "${var.ec2_name}-${count.index}"
    }
  )
}