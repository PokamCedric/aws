# Create key-pair for logging into EC2 in us-east-1
resource "aws_key_pair" "webserver_key" {
  key_name   = "webserver-key"
  public_key = file("C:\\Users\\molar\\.ssh\\id_rsa.pub")
}
