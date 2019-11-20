terraform {
  source = "git::https://github.com/andrewCluey/terraform-modules.git//modules/aws/route53"
}

include {
  path = find_in_parent_folders()
}
dependencies {
  paths = ["../vpc", "../routes"]
}
dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
    vpc_id = dependency.vpc.outputs.vpc_id
}


