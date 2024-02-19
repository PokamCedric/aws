resource "aws_vpc" "useast1" {
  depends_on          = [awscc_ec2_ipam_pool.useast1]
  ipv4_ipam_pool_id   = awscc_ec2_ipam_pool.useast1.id
  ipv4_netmask_length = 24

  tags = {
    Name = "us-east-1"
  }
}