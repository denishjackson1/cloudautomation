# Creating S3 Bucket and Adding User Group with Full Access
This repository contains Terraform configuration files to create an S3 bucket and add a group with full access to the bucket.

## Prerequisites
Before you begin, ensure you have the following:

- AWS account credentials with the necessary permissions to create resources.
- Terraform installed on your local machine. You can download it from Terraform's official website.
## Usage
Follow these steps to create an S3 bucket and add a group with full access:

1. Clone the Repository:

```bash
git clone https://github.com/denishjackson1/cloudautomation.git
cd cloudautomation
```
2. Initialize Terraform:

```bash
terraform init
```
3. Review and Apply Configuration:
Review the `main.tf` file to ensure it matches your requirements. If necessary, modify the configuration according to your preferences.

4. Apply Changes:
Run the following command to apply the Terraform configuration:

```bash
terraform apply
```
Confirm the changes when prompted.

5. Accessing the Bucket:
Once the configuration is applied successfully, you can access the created S3 bucket using the AWS Management Console or AWS CLI.

6. Cleanup
To remove the created resources and destroy the infrastructure, run the following command:

```bash
terraform destroy
```
Confirm the destruction when prompted.
