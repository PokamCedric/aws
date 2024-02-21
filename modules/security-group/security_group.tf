
resource "aws_security_group" "this" {
  name        = var.name
  description = var.description
  vpc_id      = var.vpc_id
  ingress = [
    for port in var.ports : {
      description      = "Allow traffic on port ${port.id}"
      from_port        = port.id
      to_port          = port.id
      protocol         = "tcp"
      cidr_blocks      = port.source
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

  tags = var.tags
}