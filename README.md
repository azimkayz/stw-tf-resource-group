# stw-tf-resource-group

Single-responsibility Terraform module that creates an Azure Resource Group.

## Scope

Creates only the Resource Group. Every other module in this project takes
`resource_group_name` as an input, sourced from this module's output.

## Naming — worked example

project_name = "projecta", environment = "prod" →
`rg-projecta-prod-southafricanorth`

## Usage

```hcl
module "resource_group" {
  source = "github.com/azimkayz/stw-tf-resource-group?ref=v1.0.0"

  project_name = "projecta"
  environment  = "prod"
}
```

## Requirements

| Name      | Version  |
|-----------|----------|
| terraform | >= 1.5.0 |
| azurerm   | ~> 5.4.0   |

## Inputs

| Name         | Type        | Default          | Required | Description                       |
|--------------|-------------|------------------|----------|-------------------------------------|
| project_name | string      | n/a              | yes      | Short project identifier for naming |
| environment  | string      | n/a              | yes      | Environment name for naming         |
| location     | string      | southafricanorth | no       | Azure region                        |
| tags         | map(string) | {}               | no       | Additional tags                     |

## Outputs

| Name                 | Description                                     |
|----------------------|----------------------------------------------------|
| resource_group_name  | Generated name — consumed by every other module     |
| resource_group_id    | Resource ID of the Resource Group                   |
| location             | Deployed region                                     |

## Versioning

Tagged `v1.0.0`. Consumers should pin to a tag, not a branch.