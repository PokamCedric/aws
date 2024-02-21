resource "aws_vpc" "useast2" {
  depends_on = [ awscc_ec2_ipam_pool.useast2 ]
  provider = aws.useast2

  ipv4_ipam_pool_id   = awscc_ec2_ipam_pool.useast2.id
  ipv4_netmask_length = 24

  tags = {
    Name = "us-east-2"
  }
}