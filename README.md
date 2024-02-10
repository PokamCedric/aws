# terraform \n
This is a repo to store terraform project files


# Network Steps \n
 01 Create a Provider for AWS.\n
 02 Create a VPC (Virtual Private Cloud in AWS).\n
 03 Create a Public Subnet with auto public IP Assignment enabled in custom VPC.\n
 04 Create a Private Subnet in customer VPC.\n
 05 Create an Internet Gateway for Instances in the public subnet to access the Internet.\n
 06 Create a routing table consisting of the information of Internet Gateway.\n
 07 Associate the routing table to the Public Subnet to provide the Internet Gateway address.\n
 08 Creating an Elastic IP for the NAT Gateway.\n
 09 Creating a NAT Gateway for MySQL instance to access the Internet (performing source NAT).\n
 10 Creating a route table for the Nat Gateway Access which has to be associated with MySQL Instance.\n


# App Configuration Steps
 01 Create an AWS key pair.\n
