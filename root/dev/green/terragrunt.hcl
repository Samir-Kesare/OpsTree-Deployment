include "root" {
  path = find_in_parent_folders("common.hcl")
}

terraform {
source = "git@github.com:CodeOps-Hub/Terraform-modules.git//Modules/green?ref=harshit/blue-green-module"
}

dependency "network" {
  config_path = "../network/"
}

dependency "openvpn" {
  config_path = "../openvpn/"
}

dependency "frontend" {
  config_path = "../frontend/"
}

locals {
  inputs_from_tfvars = jsondecode(read_tfvars_file("terraform.tfvars"))
}

inputs = merge(
  local.inputs_from_tfvars,
  {
    blue_tg_arn = dependency.frontend.outputs.final_target_group_arn,
    subnet_ID = dependency.network.outputs.private-subnets-id[0],
    subnet_ids = [dependency.network.outputs.private-subnets-id[0]],
    TG_vpc_id = dependency.network.outputs.vpc-id,
    security_groups_id = [dependency.frontend.outputs.Security_Group_ID[0]],
    frontend_listener_arn = dependency.network.outputs.alb-listener-arn,
  }
)
