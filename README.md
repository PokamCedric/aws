# terraform
This is a repo to store terraform project files


# Network Steps
 01 Create a Provider for AWS.
 02 Create a VPC (Virtual Private Cloud in AWS).
 03 Create a Public Subnet with auto public IP Assignment enabled in custom VPC.
 04 Create a Private Subnet in customer VPC.
 05 Create an Internet Gateway for Instances in the public subnet to access the Internet.
 06 Create a routing table consisting of the information of Internet Gateway.
 07 Associate the routing table to the Public Subnet to provide the Internet Gateway address.
 08 Creating an Elastic IP for the NAT Gateway.
 09 Creating a NAT Gateway for MySQL instance to access the Internet (performing source NAT).
 10 Creating a route table for the Nat Gateway Access which has to be associated with MySQL Instance.


# App Configuration Steps
 01 Create an AWS key pair.
