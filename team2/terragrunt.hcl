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
}