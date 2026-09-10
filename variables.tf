variable "project_name" {
  type        = string
  description = "Short project name used to build resource names (e.g. \"stw\")."
}

variable "environment" {
  type        = string
  description = "Environment name (e.g. \"dev\", \"test\", \"prod\")."
}

variable "location" {
  type        = string
  description = "Azure region. Only 'southafricanorth' is permitted for this platform."
  default     = "southafricanorth"

  validation {
    condition     = var.location == "southafricanorth"
    error_message = "location must be 'southafricanorth'. No other Azure region is permitted."
  }
}

variable "tags" {
  type        = map(string)
  description = "Common tags applied to the resource group."
  default     = {}
}
