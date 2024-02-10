# terraform 
This is a repo to store terraform project files


# Network Steps 
01 Create a Provider for AWS. <br />
02 Create a VPC (Virtual Private Cloud in AWS). <br />
03 Create a Public Subnet with auto public IP Assignment enabled in custom VPC. <br />
04 Create a Private Subnet in customer VPC. <br />
05 Create an Internet Gateway for Instances in the public subnet to access the Internet. <br />
06 Create a routing table consisting of the information of Internet Gateway. <br />
07 Associate the routing table to the Public Subnet to provide the Internet Gateway address. <br />
08 Creating an Elastic IP for the NAT Gateway. <br />
09 Creating a NAT Gateway for MySQL instance to access the Internet (performing source NAT). <br />
10 Creating a route table for the Nat Gateway Access which has to be associated with MySQL Instance. <br />


# App Configuration Steps
01 Create an AWS key pair. <br />
