# terraform-aws-FSx-gateway-mvp

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |
| <a name="requirement_awscc"></a> [awscc](#requirement\_awscc) | ~> 0.1 |
| <a name="requirement_vsphere"></a> [vsphere](#requirement\_vsphere) | >=2.2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_FSx"></a> [FSx](#module\_FSx) | ./modules/FSx | n/a |
| <a name="module_bastion"></a> [bastion](#module\_bastion) | ./modules/jumphost | n/a |
| <a name="module_quickstart_vpc"></a> [quickstart\_vpc](#module\_quickstart\_vpc) | ./modules/quickstart_vpc | n/a |
| <a name="module_vsphere"></a> [vsphere](#module\_vsphere) | ./modules/FSx_vmware | n/a |

## Resources

| Name | Type |
|------|------|
| [random_pet.name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | The name of the region you wish to deploy into | `string` | `"us-east-1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
