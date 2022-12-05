resource "aws_key_pair" "ec2_key_pair" {
  key_name   = "ec2-key"
  public_key = file("~/.ssh/ec2-key.pub")
}