include "root" {
  path = find_in_parent_folders("common.hcl")
}

terraform {
  source = "git@github.com:CodeOps-Hub/Terraform-modules.git//Modules/Network_Skeleton_Module?ref=main"  

}

locals {
  inputs_from_tfvars = jsondecode(read_tfvars_file("network.tfvars"))
}

// inputs = merge(
//   local.inputs_from_tfvars,
//   {
//     # additional inputs
//   }
// )
inputs = local.inputs_from_tfvars