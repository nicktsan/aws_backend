Before starting, navigate to the s3 folder

To use your IAM credentials to authenticate the Terraform AWS provider, set the AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY environment variables
Windows cmd prompt:
setx AWS_ACCESS_KEY_ID=<your iam access key id>
setx AWS_SECRET_ACCESS_KEY=<your iam secret access key>

Then set the AWS_PROFILE environment variable:
Windows cmd prompt:
setx AWS_PROFILE=<your iam profile name>

Ensure you have already configured Terraform CLI to work with Terraform Cloud. First, create a Terraform Cloud account. Then use the command below to configure it:
terraform login

In Terraform Cloud settings, navigate to the newly created workspace's settings, and change Execution Mode to "Local" if you are running terraform locally. 
This can be found in https://app.terraform.io/app/<username>/workspaces/<workspace name>/settings/general
Then click "Save Settings"

Use 
terraform plan -var-file input.tfvars
when planning
Use
terraform plan -var-file input.tfvars -out out.tfplan
when you want to save the output of the plan to a file.
Once the file has been created, run the command below to build the statefile in Terraform Cloud
terraform apply out.tfplan

https://www.youtube.com/watch?v=przZU7VBBGU&t=1s
11:30