
resource "aws_instance" "demo2" {
  ami           = "ami-04581fbf744a7d11f"
  instance_type = "t2.micro"
  vpc_security_group_ids = [data.aws_security_group.sg1.id]
  key_name      = "dev-wdp"
  user_data     = file("${path.module}/postgresql.sh")
  tags = {
    "Name" = var.instance_name
    "env"  = var.env
    team = var.team

  }

}

output "public-ip" {
    value = aws_instance.demo2.public_ip
  
}
output "instance-id" {
    value = aws_instance.demo2.id
  
}
output "private-ip" {
    value = aws_instance.demo2.private_ip
  
}