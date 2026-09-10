# terraform-azurerm-resource-group

Creates a single Azure Resource Group with a standard, non-hardcoded name.

## Naming
`rg-<project_name>-<environment>-<location>`

## Usage
```hcl
module "resource_group" {
  source = "git::https://github.com/<your-org>/stw-tf-resource-group.git?ref=v1.0.0"

  project_name = "stw"
  environment  = "prod"
  location     = "southafricanorth"
  tags = {
    owner = "cloud-team"
  }
}
```

## Inputs
| Name | Type | Default | Description |
|---|---|---|---|
| project_name | string | n/a | Short project name |
| environment | string | n/a | Environment name |
| location | string | southafricanorth | Azure region (validated) |
| tags | map(string) | {} | Common tags |

## Outputs
| Name | Description |
|---|---|
| resource_group_name | Name of the resource group |
| resource_group_id | Resource ID |
| location | Region |

## Versioning
Tag every release: `git tag v1.0.0 && git push origin v1.0.0`
