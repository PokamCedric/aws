## My Skills

![Languages](https://skillicons.dev/icons?i=py,js,ts,dart,c,cs,cpp,)

![Cloud Skills](https://skillicons.dev/icons?i=aws,dynamodb,bash,docker,linux,terraform,mysql,firebase)

![DevOps Skills](https://skillicons.dev/icons?i=vscode,git,github,githubactions,gitlab,jenkins)

![Fullstack Skills](https://skillicons.dev/icons?i=flutter,dotnet,nodejs,npm,nextjs,postman,react,redux,yarn)

<br />

## Table of Contents

* [CloudFormation Project](./cloudformation/)
* [IP Address Manager (IPAM)](./ipam/)
* [Deploy High Available and Fault Tolerant Dynamic Website](./fleetcart/)
* [Deploy a Static Web App on AWS with Docker, Amazon ECR, and Amazon ECS](./jupiter/)
* [Deploy a Static Web App on AWS with S3 and Cloudfront](./porfolio/)
* [Deploy a Serveless Backend with API-Gateway + Lambda + Dynamodb](./product-api/)
* [Modules](./modules/)
  * [Network Configuration of the Virtual Private Cloud (VPC)](./modules/network/)
  * [Security Group](./modules/security-group/)
  * [Identity and Access Management (IAM)](./modules/iam/)
  * [Simple Storage Service (S3)](./modules/s3/)
  * [API Gateway](./modules/api_gateway/)
  * [Relational Database Service (RDS)](./modules/rds/)
  * [Elastic Cloud Compute (EC2)](./modules/ec2/)
  * [Elastic Container Registry (ECR)](./modules/ecr/)
  * [Elastic Container Service (ECS)](./modules/ecs/)
  * [Auto Scaling Group (ASG) & Launch Template](./modules/asg/)
  * [Load Balancer](./modules/load-balancer/)
  * [AWS Certificate Manager](./modules/acm/)
  * [Route 53](./modules/route53/)
  * [Simple Notification Service (SNS)](./modules/sns/)
  * [CodeBuild)](./modules/codebuild/)

<br />

## Prerequisites
These are the prerequisites and Setup we probably need for all the projects

- Terraform installed
- Git installed
- Github Account and Github repository for the project
- VSCode with terraform extension

## Setup

### Create keypair
cmd 
```sh
ssh-keygen -t rsa -b 2048
```
t: type and b: size in byte

Press enter till the end without giving any information to save the key without password to the default folder "C:\Users\username/.ssh/id_rsa"

### Add SSh Key to Github
To add the generated ssh keypair to github please refer to the [github documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

### Create IAM user
To create IAM user please refer to the [AWS documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)

### Create Access Key and assign it to the IAM user
To create Access Key and assign it to the IAM user please refer to the [AWS documentation](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html#Using_CreateAccessKey)!

### Create named profile

cmd
```sh
aws configure --profile profile-name
```
Please as a profile name give the name of the IAM user you've created

### Create bucket to store terraform state file

cmd
```sh
aws s3api create-bucket --bucket unique-bucket-name
```