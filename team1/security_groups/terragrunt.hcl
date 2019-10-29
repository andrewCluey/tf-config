# This is an example deployment of the security_groups module using terragrunt.
# most values are inherited from the parent 'terragrunt.hcl' file.

terraform {
  source = "../../../../modules//security_groups"
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