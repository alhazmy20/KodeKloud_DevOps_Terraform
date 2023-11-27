# Provisioning AWS Resources

This project is a simple demonstration of the skills acquired during the DevOps Learning Path on KodeKloud, focusing on provisioning AWS resources using Terraform.

## Project Overview

The project utilizes three distinct configuration files to provision resources related to three AWS services:

### IAM Service
- Creates users, a group, and a policy.
- Assigns the created policy to both the admin user and the group.

### VPC Service
- Establishes a VPC with four subnets (2 Public and 2 Private in two different Availability Zones).
- Configures an Internet Gateway for the route table containing public subnets.
- Sets up a route table for private subnets and associates private subnets with it.
- Implements a NAT Gateway for a private subnet and associates it with the private route table.
- Allocates an Elastic IP (EIP) and assigns it to the NAT Gateway.

### EC2 Service
- Deploys four EC2 instances in each subnet.
- Defines a security group to allow traffic from any source.

## Environment Variables

Before using the project, generate AWS Access Keys and add them to the environment variables using the following commands:

```bash
export AWS_ACCESS_KEY_ID='yourAccessKeyID'
export AWS_SECRET_ACCESS_KEY='yourSecretAccessKey'
```

## Usage
Follow these steps within the `AWS-Deploy` directory to deploy and manage the AWS resources:

1. **Create a Workspace:**
```bash
terraform workspace new EU-Deploy
```
2. **Initialize Terraform:**
```bash
terraform init
```
Initialize the Terraform working directory and download the AWS provider.

3. **(Optional) Preview Changes:**
```bash
terraform plan
```
This step allows you to review the changes Terraform will apply before provisioning resources.

4. **Apply Changes and Provision Resources:**
```bash
terraform apply
```
Apply the changes and provision the AWS resources.

5. **Destroy All Resources:**
```bash
terraform destroy
```
Use this command to destroy all the resources created by Terraform.

