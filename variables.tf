variable "project_name" {
  type        = string
  description = "Short project identifier used in resource naming, e.g. 'projecta'."
}

variable "environment" {
  type        = string
  description = "Environment name used in resource naming, e.g. 'dev', 'test', 'prod'."
}

variable "location" {
  type        = string
  default     = "southafricanorth"
  description = "Azure region to deploy into."

  validation {
    condition     = var.location == "southafricanorth"
    error_message = "Only 'southafricanorth' is permitted as the deployment region for this project."
  }
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Optional tags to apply to the Resource Group."
}