# Kubernetes Go WebAPI Application

This project is a simple showcase of skills developed during the DevOps Learning Path on KodeKloud. Its purpose is to deploy a Go WebAPI Application in Kubernetes using **Terraform**.

## Usage
To effectively use this project, follow these steps within the `Go-WebAPI-Application` directory:

1. **Initialize Terraform:**
```bash
terraform init
```
Initialize the Terraform working directory and download the Kubernetes provider.

2. **(Optional) Preview Changes:**
```bash
terraform plan
```
This step allows you to review the changes Terraform will apply before provisioning resources.

3. **Apply Changes and Provision Resources:**
```bash
terraform apply
```
Apply the changes and provision the Kubernetes resources.

4. **Destroy All Resources:**
```bash
terraform destroy
```
Use this command to destroy all the resources created by Terraform.

