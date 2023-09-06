resource "aws_network_interface" "ec2_nic" {
  subnet_id       = var.public_subnet_id
  security_groups = [var.public_sg_id, var.default_sg_id] # Public sg to be reachable from home | default sg to talk to internal components
}

resource "aws_instance" "workstation_2" {
  ami               = "ami-051a73f2d9cfe4508"
  instance_type     = "m4.large"
  key_name          = aws_key_pair.deployer.key_name
  get_password_data = true
  # user_data_base64 = "PHBvd2Vyc2hlbGw+DQogU2V0LUV4ZWN1dGlvblBvbGljeSBCeXBhc3MgLVNjb3BlIFByb2Nlc3MgLUZvcmNlOyBbU3lzdGVtLk5ldC5TZXJ2aWNlUG9pbnRNYW5hZ2VyXTo6U2VjdXJpdHlQcm90b2NvbCA9IFtTeXN0ZW0uTmV0LlNlcnZpY2VQb2ludE1hbmFnZXJdOjpTZWN1cml0eVByb3RvY29sIC1ib3IgMzA3MjsgaWV4ICgoTmV3LU9iamVjdCBTeXN0ZW0uTmV0LldlYkNsaWVudCkuRG93bmxvYWRTdHJpbmcoJ2h0dHBzOi8vY2hvY29sYXRleS5vcmcvaW5zdGFsbC5wczEnKSkNCg0KV3JpdGUtTG9nICJjaG9jbyBpbnN0YWxsIC15IDd6aXAuaW5zdGFsbCINCmNob2NvIGluc3RhbGwgLXkgN3ppcC5pbnN0YWxsDQoNCldyaXRlLUxvZyAiY2hvY28gSW5zdGFsbCBHb29nbGUgQ2hyb21lIg0KY2hvY28gaW5zdGFsbCAteSBnb29nbGVjaHJvbWUgLWlnbm9yZS1jaGVja3N1bQ0KDQpXcml0ZS1Mb2cgImNob2NvIEluc3RhbGwgUG9zdG1hbiINCmNob2NvIGluc3RhbGwgLXkgcG9zdG1hbg0KDQpXcml0ZS1Mb2cgImNob2NvIEluc3RhbGwgUG9zdGdyZXMiDQpjaG9jbyBpbnN0YWxsIC15IHBvc3RncmVzcWwNCg0KPC9wb3dlcnNoZWxsPg0K"

  network_interface {
    network_interface_id = aws_network_interface.workstation_2_nic.id
    device_index         = 0
  }

  root_block_device {
    volume_size = 128
  }

  tags = {
    Name = "windows_workstation_01"
  }
}