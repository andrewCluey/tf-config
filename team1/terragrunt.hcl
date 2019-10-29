remote_state {
  backend = "s3"
  config = {
    bucket         = "asc-test-tfa"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-2"
    encrypt        = true
    dynamodb_table = "asc-dev-lock"
  }
}

inputs = {
  vpc_cidr         = "10.181.0.0/21"
  aws_region       = "eu-west-2"
  BusinessUnit     = "Test"
  EnvironmentStage = "Development"
  Team             = "Test1"
  assume_role_arn  = "arn:aws:iam::IAMIDREPLACE:role/OPS"
  ops_role_arn     = "arn:aws:iam::IAMIDREPLACE:role/OPS"
  root_vpcid       = "vpc-rootid"
  ops_vpcid        = "vpc-opsid"

  
  # Map of VPC_ID : VPC_OWNER_ID. Each Key/Value pair creates a new Peer link.
  # VPC ID must be first
  # EXAMPLE - {"VPC-1234" = "OWNER1234", "VPC-5678" = "OWNER5678"}
  vpc_peer_map = {
    "vpc-opsid" = "OPSVPC_OWNER_ID",
    "vpc-DEVID" = "DEVVPC_OWNER_ID"
  }
  # Map of VPC_ID : VPC_CIDR.
  # VPC ID must be first.
  # EXAMPLE - {"VPC-1234" = "10.20.0.0/16", "VPC-5678" = "192.168.10.0/24"}
  peer_vpc_cidr = {
    "vpc-f2e1419bopsid" = "172.27.0.0/16",
    "vpc-DEVID"         = "172.28.0.0/16"
    }
}