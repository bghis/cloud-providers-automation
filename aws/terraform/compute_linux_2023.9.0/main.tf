resource "aws_network_interface" "ec2_nic" {
  subnet_id       = var.subnet_id
  security_groups = var.security_groups 
}

resource "aws_instance" "ec2" {
  ami              = var.ami
  instance_type    = var.instance_type
  key_name         = var.key_name
  
  network_interface {
    network_interface_id = aws_network_interface.ec2_nic.id
    device_index         = 0
  }

  root_block_device {
    volume_size = var.osdisk_size
  }

  tags = {
    Name = var.hostname
  }
}