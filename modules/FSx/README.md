# FSx

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.75.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_storagegateway_cache.fsx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/storagegateway_cache) | resource |
| [aws_storagegateway_gateway.myfsx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/storagegateway_gateway) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_storagegateway_local_disk.fsx](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/storagegateway_local_disk) | data source |
| [aws_subnets.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_disk_path"></a> [disk\_path](#input\_disk\_path) | Path on the FSx appliance in vsphere where the cache disk resides on the OS | `string` | `"/dev/sdb"` | no |
| <a name="input_dns_ips"></a> [dns\_ips](#input\_dns\_ips) | A list of DNS IPs | `list(string)` | <pre>[<br>  "10.0.0.111",<br>  "10.0.0.222"<br>]</pre> | no |
| <a name="input_domain_controllers"></a> [domain\_controllers](#input\_domain\_controllers) | Comma separated list of domain controllers. | `list(any)` | `[]` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The name of the region you wish to deploy into | `string` | `"corp.myfsx.com"` | no |
| <a name="input_gateway_ip_address"></a> [gateway\_ip\_address](#input\_gateway\_ip\_address) | IP Address of the FSx appliance in vSphere | `string` | n/a | yes |
| <a name="input_gateway_type"></a> [gateway\_type](#input\_gateway\_type) | Type of the gateway | `string` | `"FILE_FSX_SMB"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name given resources | `string` | `"aws-IA"` | no |
| <a name="input_password"></a> [password](#input\_password) | The password for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain | `string` | `"avoid-plaintext-passwords"` | no |
| <a name="input_storage_capacity"></a> [storage\_capacity](#input\_storage\_capacity) | Storage capacity (GiB) of the file system | `string` | `"300"` | no |
| <a name="input_throughput_capacity"></a> [throughput\_capacity](#input\_throughput\_capacity) | Throughput (megabytes per second) of the file system | `string` | `"1024"` | no |
| <a name="input_timezone"></a> [timezone](#input\_timezone) | Time zone for the gateway. The time zone is of the format GMT, GMT-hr:mm, or GMT+hr:mm. | `string` | `"GMT"` | no |
| <a name="input_username"></a> [username](#input\_username) | The user name for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain | `string` | `"Admin"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_disk"></a> [disk](#output\_disk) | n/a |
| <a name="output_storage_gateway"></a> [storage\_gateway](#output\_storage\_gateway) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
