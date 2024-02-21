# Create the IPAM resource
# Verify the resource is supported with the CLI
# cmd: aws cloudformation describe-type --type RESOURCE --type-name AWS::EC2::IPAM --region us-east-1 | grep '.ProvisioningType'
# output: "ProvisioningType": "FULLY_MUTABLE"
resource "awscc_ec2_ipam" "main" {
  operating_regions = [
    {
      region_name = "us-east-1"
    },
    {
      region_name = "us-east-2"
    }
  ]
  tags = [{
    key   = "Name"
    value = "global-ipam"
  }]
}
