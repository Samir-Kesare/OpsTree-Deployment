include "root" {
  path = find_in_parent_folders("common.hcl")
}

terraform {
source = "git@github.com:CodeOps-Hub/Terraform-modules.git//Modules/target-group?ref=harshit/rolling-module"
}

dependency "network" {
  config_path = "../network/"
}

locals {
  inputs_from_tfvars = jsondecode(read_tfvars_file("rollingTG.tfvars"))
}

inputs = merge(
  local.inputs_from_tfvars,
  {
    tg_vpc_id = dependency.network.outputs.vpc-id
  }
)