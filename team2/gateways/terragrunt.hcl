# This is an example deployment of the gateways module using terragrunt.
# most values are inherited from the parent 'terragrunt.hcl' file.

terraform {
  source = "git::https://github.com/andrewCluey/terraform-modules.git//modules/aws/gateways"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  vpc_id              = dependency.vpc.outputs.vpc_id
  availability_zone_a = dependency.vpc.outputs.availability_zone_a
}