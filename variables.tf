variable "path" {
  description = "Prefix path of the parameter(s) to retrive."
  type        = string

  validation {
    condition     = startswith(var.path, "/") && endswith(var.path, "/")
    error_message = "Path must start with / and end with /."
  }
}
