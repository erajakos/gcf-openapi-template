# Google Cloud Functions Example API  (template)

## Description
This project serves as a template for utilizing Google Cloud functions with Python, Google Cloud API Gateway with OpenAPI 2 definitions, and Terraform to manage the infrastructure. It provides an example of how to set up and deploy a simple API using these technologies.

## Requirements
- Python 3.x
- Terraform 0.x
- Google Cloud SDK

## Getting Started
1. Create project in Google Cloud
2. Create service account in Google Cloud IAM management
3. Clone the repository: `git clone https://github.com/erajakos/gcf-openapi-template.git`
4. Create JSON key for service account, save it to `auth-file.json`
5. Copy `terraform.tfvars.template` into `terraform.tfvars` and customize the environment variables
5. Install Google Cloud SDK: `brew install --cask google-cloud-sdk`
6. Initialize gcloud: `gcloud init`
7. Enable Cloud Functions API `gcloud services enable cloudfunctions.googleapis.com`
8. Enable Cloud Build API `gcloud services enable cloudbuild.googleapis.com`
9.  Enable API Gateway API `gcloud services enable apigateway.googleapis.com`
10. Enable Compute Engine API `gcloud services enable compute.googleapis.com`
11. Add roles/iam.serviceAccountUser to service account: `gcloud iam service-accounts add-iam-policy-binding SERVICE_ACCOUNT_EMAIL --member 'serviceAccount:SERVICE_ACCOUNT_EMAIL' --role roles/iam.serviceAccountUser`
12. Change into the terraform directory: `cd gcf-openapi-template/terraform`
13. Initialize Terraform: `terraform init`
14. Apply the Terraform configuration: `terraform apply`
15. Try the function `gcloud functions call helloWorld --region=europe-west1`
16. Update the OpenAPI definition file in the `functions` directory

Terraform handles updates to the infrastructure and function code. Run `terraform apply` to sync the changes to the cloud.

## Usage
Once the infrastructure is set up, you can make requests to the API Gateway endpoint to trigger the Cloud function.

## Test a function locally
```bash
pip install functions-framework
cd functions/helloWorld
functions-framework --target=hello_world
curl http://localhost:8080
``` 

## Troubleshooting
- Make sure you have the correct permissions to access the Google Cloud project
- Make sure the service account has the sufficient roles to create and manage the Cloud resources
- Verify that the function and API Gateway are correctly configured in the Terraform configuration
- Check the Cloud function logs for any issues with the Python code

## Terraform state
It is a good idea to store terraform state in remote backend
https://developer.hashicorp.com/terraform/language/state/remote

Also, try to manage the project resources with terraform only. Otherwise the state might fall out-of-sync.
