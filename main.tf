data "aws_ssm_parameters_by_path" "parameters" {
  path = var.path
}

locals {
  string_types        = matchkeys(data.aws_ssm_parameters_by_path.parameters.names, data.aws_ssm_parameters_by_path.parameters.types, ["String"])
  string_secure_types = matchkeys(data.aws_ssm_parameters_by_path.parameters.names, data.aws_ssm_parameters_by_path.parameters.types, ["SecureString"])
  string_list_types   = matchkeys(data.aws_ssm_parameters_by_path.parameters.names, data.aws_ssm_parameters_by_path.parameters.types, ["StringList"])
  zip_names_values    = zipmap(data.aws_ssm_parameters_by_path.parameters.names, data.aws_ssm_parameters_by_path.parameters.values)
  values = merge(
    { for key in local.string_types : trimprefix(key, data.aws_ssm_parameters_by_path.parameters.path) => nonsensitive(local.zip_names_values[key]) },
    { for key in local.string_list_types : trimprefix(key, data.aws_ssm_parameters_by_path.parameters.path) => split(",", nonsensitive(local.zip_names_values[key])) }
  )
  sensitive_values = { for key in local.string_secure_types : trimprefix(key, data.aws_ssm_parameters_by_path.parameters.path) => local.zip_names_values[key] }
}
