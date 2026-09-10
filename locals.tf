locals {
  # <resource>-<project_name>-<environment>-<region>
  resource_group_name = "rg-${var.project_name}-${var.environment}-${var.location}"
}
