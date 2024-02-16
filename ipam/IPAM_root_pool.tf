# Create the IPAM Pool resource
# Verify the resource is supported with the CLI
# cmd: aws cloudformation describe-type --type RESOURCE --type-name AWS::EC2::IPAMPool --region us-east-1 | grep '.ProvisioningType'
# output: "ProvisioningType": "FULLY_MUTABLE"
resource "awscc_ec2_ipam_pool" "root" {
  address_family = "ipv4"
  ipam_scope_id  = awscc_ec2_ipam.main.private_default_scope_id
  auto_import    = false

  provisioned_cidrs = [
    {
      cidr = "10.0.0.0/16"
    }
  ]

  tags = [{
    key   = "Name"
    value = "top-level-pool"
  }]
}
