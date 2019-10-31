# Creates a new VPC and subnets in the designated region 
# Values are inherited from the parent config file (Terragrunt.hcl).

terraform {
  source = "git::https://github.com/andrewCluey/terraform-modules.git//modules/aws/vpc"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  dhcp_options_domain_name_servers = ["172.28.1.53", "172.28.1.54"]
  ad_name                          = "ad.domain.net"
}
