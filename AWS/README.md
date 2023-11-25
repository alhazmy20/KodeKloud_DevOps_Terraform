# Provisioning AWS Resources

This is a simple project created to showcase what I've learned while attending the DevOps Learning Path on KodeKloud.
- The purpose of this project is to Provision AWS Resources using **Terraform**.

# Contains
- This project uses 3 different configuration files to provision different resources related to 3 services including:
    - **IAM Service:** 
        - Creating users, a group, and a policy.
        - Assign the created policy to the admin user and the group.
    - **VPC Service:**
        - VPC with 4 Subnets (2 Public and 2 Private in two different AZs)
        - Internet Gateway for the route table that includes public subnets.
        - Route table for the private subnets then associate the private subnets with it.
        - NAT Gateway for a private subnet then associate it with the private route table.
        - EIP and assign it to the NAT Gateway 
    - **EC2 Service:**
        - Four EC2 instances in each subnet that created.
        - A security group to allow traffic from everywhere.

## Environment Variables

You must generate **AWS Access Keys** and then add them to the environment
variables.
```bash
export AWS_ACCESS_KEY_ID= 'yourAccessKeyID'
export AWS_SECRET_ACCESS_KEY= 'yourSecretAccessKey'
```
## Usage
The following commands you need to execute inside `AWS-Deploy` directory.
- Create a workspace named **EU-Deploy** using the following command:
```bash
terraform workspace new EU-Deploy
```
- Initialize the terraform working directory and download the `AWS` provider using the following command:
```bash
terraform init
```
- **Optional:** You can see the changes that Terraform will apply before the provisioning using the following command:
```bash
terraform plan
```
- Apply the changes and provision the resources using the following command:
```bash
terraform apply
```
- You can destroy all the resources that you created using the following command:
```bash
terraform destroy
```