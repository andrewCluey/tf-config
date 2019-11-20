# This is an example deployment of the routes module using terragrunt.
# Most values are inherited from the parent 'terragrunt.hcl' file.

terraform {
  source = "git::https://github.com/andrewCluey/terraform-modules.git//modules/aws/routing_table/?ref=feature/routing_table"
}

include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "gateways" {
  config_path = "../gateways"
}

inputs = {
  vpc_id            = dependency.vpc.outputs.vpc_id
  igw_id            = dependency.gateways.outputs.igw_id
}