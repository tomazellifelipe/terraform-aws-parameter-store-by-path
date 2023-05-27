output "values" {
  description = "Parameter store values by path."
  value       = local.values
}

output "sensitive_values" {
  description = "Parameter store secure values by path."
  value       = local.sensitive_values
  sensitive   = true
}
