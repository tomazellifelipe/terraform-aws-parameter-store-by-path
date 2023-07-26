module "network_parameters" {
  source = "../.."
  path   = "/network/"
}

output "vpc_id" {
  value = module.network_parameters.values["vpc_id"]
}

output "vpc_cidr_block" {
  value = module.network_parameters.values["vpc_cidr_block"]
}

output "public_subnet_ids" {
  value = module.network_parameters.values["public_subnet_ids"]
}

output "private_subnet_ids" {
  value = module.network_parameters.values["private_subnet_ids"]
}

output "network_private_token" {
  value = module.network_parameters.sensitive_values["network_private_token"]
}