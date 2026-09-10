# terraform-azurerm-resource-group

Creates a single Azure Resource Group. Everything else in this platform is deployed into the resource group this module produces — nothing else about the environment is in scope here.

## Scope

**Creates**
- One `azurerm_resource_group`

**Does not create**
- Any networking, compute, storage, or monitoring resources — every other module in this platform
- Role assignments or resource locks on the resource group

## Usage

```hcl
module "resource_group" {
  source = "github.com/azimkayz/terraform-azurerm-resource-group?ref=v1.0.0"

  project_name = "stw"
  environment  = "prod"
  location     = "southafricanorth"

  tags = {
    owner = "cloud-team"
  }
}
```

A minimal, runnable example is in [`examples/basic`](./examples/basic).

## Naming

Pattern: `rg-<project_name>-<environment>-<location>`

Example: `rg-stw-prod-southafricanorth`

`location` is validated to accept only `southafricanorth` — no other Azure region is permitted on this platform, so a `terraform plan` with any other region value fails at the variable validation stage rather than producing an unexpected deployment.

## Inputs

| Name | Type | Required | Default | Description |
|---|---|---|---|---|
| `project_name` | `string` | Yes | – | Project identifier used in resource naming, e.g. `'projecta'`. |
| `environment` | `string` | Yes | – | Environment name used in resource naming, e.g. `'dev'`, `'test'`, `'prod'`. |
| `location` | `string` | No | `"southafricanorth"` | Azure region to deploy into. Validated to reject every value except `southafricanorth`. |
| `tags` | `map(string)` | No | `{}` | Optional tags to apply to the Resource Group. |

## Outputs

| Name | Description | Consumed by |
|---|---|---|
| `resource_group_name` | Name of the created resource group. | Every other module in this platform — passed in as `resource_group_name`. |
| `resource_group_id` | Resource ID of the resource group. | Not currently consumed by another module; available for role assignments or policy scoping. |
| `location` | Location of the resource group. | Not currently consumed by another module; available for callers that want to avoid re-declaring the region. |

## Requirements

| Name | Version |
|---|---|
| Terraform | `>= 1.5.0` |
| azurerm provider | `~> 3.90` |

## Versioning

Only tagged releases are supported for consumption — always pin `?ref=vX.Y.Z` in the `source` argument. `main` is not a supported consumption target and may change without notice.