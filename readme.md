These are the prerequisites and Setup we probably need for all the projects

## Prerequisites
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