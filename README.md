This project provisions an S3 bucket as well as a Dynamo DB table in AWS via terraform.

Prerequisites: 
- Terraform CLI (https://developer.hashicorp.com/terraform/downloads)
- Terraform Cloud account (https://app.terraform.io/app)
- A Terraform Cloud Organization with the same name as the one defined in s3/backend.tf
The name of the organization can be changed to fit your needs. Just make sure the names in Terraform cloud and s3/backend.tf match.

Before starting, navigate to the s3 folder

Use your IAM credentials to authenticate the Terraform AWS provider. Set the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables
Windows cmd prompt:
setx AWS_ACCESS_KEY_ID=<your iam access key id>
setx AWS_SECRET_ACCESS_KEY=<your iam secret access key>

Then set the AWS_PROFILE environment variable:
Windows cmd prompt:
setx AWS_PROFILE=<your iam profile name>

Ensure you have already configured Terraform CLI to work with Terraform Cloud. First, create a Terraform Cloud account at https://app.terraform.io/signup/account. Then use the command below to configure it:
terraform login

Then run: terraform init
This will create the .terraform folder in the directory where your .tf files are

Then run: terraform plan -var-file input.tfvars -out out.tfplan
This will save the output of the plan to a file and create the workspace in your Terraform organization.

In Terraform Cloud settings, navigate to the newly created workspace's settings, and change Execution Mode to "Local" if you are running terraform locally. 
This can be found in https://app.terraform.io/app/<username>/workspaces/<workspace name>/settings/general
Then click "Save Settings"

Once the file has been created, run the command below to build the statefile in Terraform Cloud
terraform apply out.tfplan

