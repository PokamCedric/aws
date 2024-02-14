
resource "aws_security_group" "sg" {
  name        = var.sg_name
  description = var.sg_desc
  vpc_id      = var.vpc_id
  ingress = [
    for port in var.ports : {
      description      = "Allow ${port} traffic"
      from_port        = port
      to_port          = port
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.sg_tags
}