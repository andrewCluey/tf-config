# This is an example deployment of the routes module using terragrunt.
# Most values are inherited from the parent 'terragrunt.hcl' file.

terraform {
  source = "git::git@github.com:andrewCluey/terraform-modules.git//modules/aws/routes"
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
  pub_net_ids       = dependency.vpc.outputs.pub_net_ids
  db_net_ids        = dependency.vpc.outputs.db_net_ids
  priv_appnet_ids   = dependency.vpc.outputs.priv_appnet_ids
  priv_webnet_ids   = dependency.vpc.outputs.priv_webnet_ids
  vpcid_peer_linkid = dependency.vpc.outputs.vpcid_peer_linkid
}