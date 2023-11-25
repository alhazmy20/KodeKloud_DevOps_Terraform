# Provisioning AWS Resources

This is a simple project created to showcase what I've learned while attending the DevOps Learning Path on KodeKloud.
- The purpose of this project is to provision Kubernetes is to Deploy WebAPI Application using **Terraform**.

## Usage
The following commands you need to execute it inside `Go-WebAPI-Application` directory.
- Initialize terraform working directory and download the `Kubernetes` provider using the following command:
```bash
terraform init
```
- **Optional:** You can see the changes that terraform will apply before the provisioning using the following command:
```bash
terraform plan
```
- Apply the changes and provision the cluster using the following command:
```bash
terraform apply
```
You can delete all resources related to the cluster you created using the following command:
```bash
terraform destroy
```