# tf-config
terraform/terragrunt deployment configuration

## How to use these config files
The files here are intended to be used with Terragrunt in order to keep terraform code DRY. 

Additional examples will be added from time to time so check back to see what's available.

All code has been tested with Terraform v0.12+ and terragrunt v0.21+

The examples here have different configs defined for different teams. For example, Team1 has a different CIDR range for AWS VPCs to Team2.

Both config definitions pull down the terraform modules from the Terraform-Modules repositoy in GitHub (currently they will both pull down the latest 'Master' branch.

### Jenkins
The Jenkinsfile included here shows a simple pipeline that runs terraform/terragrunt inside a Docker container. 
