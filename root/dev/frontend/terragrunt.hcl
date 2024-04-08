include "root" {
  path = find_in_parent_folders("common.hcl")
}

terraform {
source = "git@github.com:CodeOps-Hub/Terraform-modules.git//Modules/Auto_Sacling_Module?ref=harshit/rolling-module"
}

dependency "network" {
  config_path = "../network/"
}

dependency "openvpn" {
  config_path = "../openvpn/"
}

// dependency "targetGroup" {
//   config_path = "../rollingTG/"
// }


locals {
  inputs_from_tfvars = jsondecode(read_tfvars_file("frontend.tfvars"))
}

inputs = merge(
  local.inputs_from_tfvars,
  {
    // target_group_arn =  dependency.targetGroup.outputs.target_group_arn[0]
    SG_vpc_id = dependency.network.outputs.vpc-id
    subnet_ID = dependency.network.outputs.private-subnets-id[0]
    listener_arn = dependency.network.outputs.alb-listener-arn
    subnet_ids = [dependency.network.outputs.private-subnets-id[0]]
    TG_vpc_id = dependency.network.outputs.vpc-id
    inbound_ports = [
  { port                                = 22, protocol = "tcp", cidr_blocks = "20.0.0.0/28" },                     # Management VPC Cidr Block
  { port                                = 22, protocol = "tcp", security_group_ids =  dependency.openvpn.outputs.Security_Group_ID[0] }, # OpenVPN-SG     
  { port                                = 3000, protocol = "tcp", security_group_ids = dependency.network.outputs.alb-sg-id },   #  Dev-Frontend-lb-sg ID
]
  }
)