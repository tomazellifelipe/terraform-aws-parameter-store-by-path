<!-- BEGIN_TF_DOCS -->
# parameter-store-by-path

Return values from AWS Parameter Store using by path data block in a friendly formatted way.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssm_parameters_by_path.parameters](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssm_parameters_by_path) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_path"></a> [path](#input\_path) | Prefix path of the parameter(s) to retrive. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sensitive_values"></a> [sensitive\_values](#output\_sensitive\_values) | Parameter store secure values by path. |
| <a name="output_values"></a> [values](#output\_values) | Parameter store values by path. |

---
by @tomazellifelipe
<!-- END_TF_DOCS -->