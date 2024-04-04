include "root" {
  path = find_in_parent_folders("common.hcl")
}

terraform {
source                         = "git@github.com:CodeOps-Hub/Terraform-modules.git//Modules/VM-Module?ref=main"  
}

dependency "network" {
  config_path = "/home/harshit/Deployment/root/dev/network/"
  
}

locals {
  inputs_from_tfvars = jsondecode(read_tfvars_file("openVPN.tfvars"))
}

inputs = merge(
  local.inputs_from_tfvars,
  {
    vpc_id = dependency.network.outputs.vpc-id
    subnet_id = dependency.network.outputs.public-subnets-id[0]
  }
)