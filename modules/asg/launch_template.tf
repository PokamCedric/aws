resource "aws_launch_template" "launch_template" {
    name = "launch-template"
    description = "launch-template for asg"
    image_id = var.ami_id
    instance_type = "t2.micro"
    vpc_security_group_ids = var.sg_ids
    user_data = base64encode(file("${var.user_data_path}"))
  
}