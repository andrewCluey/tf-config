# This is an example deployment of the alb module using terragrunt.
# Most values are inherited from the parent 'terragrunt.hcl' file.

terraform {
  source = "git::git@github.com:andrewCluey/terraform-modules.git//modules/aws/alb"
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

dependency "security_groups" {
  config_path = "../security_groups"
}

dependency "target_groups" {
  config_path = "../target_groups"
}

inputs = {
  vpc_id             = dependency.vpc.outputs.vpc_id
  pub_net_ids        = dependency.vpc.outputs.pub_net_ids
  priv_appnet_ids    = dependency.vpc.outputs.priv_appnet_ids
  igw_id             = dependency.gateways.outputs.igw_id
  public_alb_sg_id   = dependency.security_groups.outputs.public_alb_sg_id
  int_alb_sg_id      = dependency.security_groups.outputs.int_alb_sg_id
  cms_80_arn         = dependency.target_groups.outputs.cms_80_arn
  app_80_arn         = dependency.target_groups.outputs.app_80_arn
  liabilities_80_arn = dependency.target_groups.outputs.liabilities_80_arn
  rgi_80_arn         = dependency.target_groups.outputs.rgi_80_arn
  ws_80_arn          = dependency.target_groups.outputs.ws_80_arn
  api_80_arn         = dependency.target_groups.outputs.api_80_arn
  web_80_arn         = dependency.target_groups.outputs.web_80_arn
  mb_3500_arn        = dependency.target_groups.outputs.mb_3500_arn
  srv_80_arn         = dependency.target_groups.outputs.srv_80_arn
}