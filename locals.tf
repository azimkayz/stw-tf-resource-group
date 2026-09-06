locals {
  resource_group_name = "rg-${var.project_name}-${var.environment}-${var.location}"

  common_tags = merge(
    {
        project = var.project_name
        environment = var.environment
        managed_by = "Qays"
    },
    var.tags
  )
}