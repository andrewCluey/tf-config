# This is an example deployment of the target_groups module using terragrunt.
# Some values have been inherited from the parent 'terragrunt.hcl' file.

terraform {
  source = "git::git@github.com:andrewCluey/terraform-modules.git//modules/aws/target_groups"
}
dependencies {
  paths = ["../vpc", "../security_groups", "../routes"]
}
include {
  path = find_in_parent_folders()
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  vpc_id = dependency.vpc.outputs.vpc_id
}