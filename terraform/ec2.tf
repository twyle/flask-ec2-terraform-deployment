resource "aws_instance" "dev_node" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.server_ami.id

  tags = {
    Name = "dev-node"
  }

  key_name               = aws_key_pair.ec2_key_pair.id
  vpc_security_group_ids = [aws_security_group.load-balancer.id]
  subnet_id              = aws_subnet.public_subnets[0].id

  root_block_device {
    volume_size = 10
  }

  user_data = file("userdata.tpl")
  associate_public_ip_address = true
} 