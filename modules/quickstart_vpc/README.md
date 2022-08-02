# quickstart_vpc

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
| [aws_eip.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat_gw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_network_acl.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) | resource |
| [aws_network_acl_rule.public_inbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_network_acl_rule.public_outbound](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) | resource |
| [aws_route.private_A_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.public_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route_table.private_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.private_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.private_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.public](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_endpoint.dynamodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint_route_table_association.private_A](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_route_table_association) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden | `string` | `"10.0.0.0/16"` | no |
| <a name="input_custom_inbound_acl_rules"></a> [custom\_inbound\_acl\_rules](#input\_custom\_inbound\_acl\_rules) | Custom subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_custom_outbound_acl_rules"></a> [custom\_outbound\_acl\_rules](#input\_custom\_outbound\_acl\_rules) | Custom subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_enable_dns_hostnames"></a> [enable\_dns\_hostnames](#input\_enable\_dns\_hostnames) | Should be true to enable DNS hostnames in the VPC | `bool` | `true` | no |
| <a name="input_enable_dns_support"></a> [enable\_dns\_support](#input\_enable\_dns\_support) | Should be true to enable DNS support in the VPC | `bool` | `true` | no |
| <a name="input_instance_tenancy"></a> [instance\_tenancy](#input\_instance\_tenancy) | A tenancy option for instances launched into the VPC | `string` | `"default"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name given resources | `string` | `"aws-quickstart"` | no |
| <a name="input_private_subnets_A"></a> [private\_subnets\_A](#input\_private\_subnets\_A) | A list of private subnets inside the VPC | `list(string)` | <pre>[<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_private_subnets_B"></a> [private\_subnets\_B](#input\_private\_subnets\_B) | A list of private subnets inside the VPC | `list(string)` | <pre>[<br>  "10.0.192.0/21",<br>  "10.0.200.0/21",<br>  "10.0.208.0/21",<br>  "10.0.216.0/21",<br>  "10.0.224.0/22",<br>  "10.0.228.0/22"<br>]</pre> | no |
| <a name="input_public_inbound_acl_rules"></a> [public\_inbound\_acl\_rules](#input\_public\_inbound\_acl\_rules) | Public subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_public_outbound_acl_rules"></a> [public\_outbound\_acl\_rules](#input\_public\_outbound\_acl\_rules) | Public subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | A list of private subnets inside the VPC | `list(string)` | <pre>[<br>  "10.0.0.0/24",<br>  "10.0.1.0/24"<br>]</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | The name of the region you wish to deploy into | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_DynamoDBVPCEndpoint"></a> [DynamoDBVPCEndpoint](#output\_DynamoDBVPCEndpoint) | Dynamo DB VPC Endpoint |
| <a name="output_NAT1EIP"></a> [NAT1EIP](#output\_NAT1EIP) | NAT 1 IP address |
| <a name="output_NAT2EIP"></a> [NAT2EIP](#output\_NAT2EIP) | NAT 2 IP address |
| <a name="output_NAT3EIP"></a> [NAT3EIP](#output\_NAT3EIP) | NAT 3 IP address |
| <a name="output_NAT4EIP"></a> [NAT4EIP](#output\_NAT4EIP) | NAT 4 IP address |
| <a name="output_PrivateSubnet1ACIDR"></a> [PrivateSubnet1ACIDR](#output\_PrivateSubnet1ACIDR) | Private subnet 1A CIDR in Availability Zone 1 |
| <a name="output_PrivateSubnet1AID"></a> [PrivateSubnet1AID](#output\_PrivateSubnet1AID) | Private subnet 1A ID in Availability Zone 1 |
| <a name="output_PrivateSubnet1ARouteTable"></a> [PrivateSubnet1ARouteTable](#output\_PrivateSubnet1ARouteTable) | Private subnet 1A route table |
| <a name="output_PrivateSubnet2ACIDR"></a> [PrivateSubnet2ACIDR](#output\_PrivateSubnet2ACIDR) | Private subnet 2A CIDR in Availability Zone 2 |
| <a name="output_PrivateSubnet2AID"></a> [PrivateSubnet2AID](#output\_PrivateSubnet2AID) | Private subnet 2A ID in Availability Zone 2 |
| <a name="output_PrivateSubnet2ARouteTable"></a> [PrivateSubnet2ARouteTable](#output\_PrivateSubnet2ARouteTable) | Private subnet 2A route table |
| <a name="output_PrivateSubnet3ACIDR"></a> [PrivateSubnet3ACIDR](#output\_PrivateSubnet3ACIDR) | Private subnet 3A CIDR in Availability Zone 3 |
| <a name="output_PrivateSubnet3AID"></a> [PrivateSubnet3AID](#output\_PrivateSubnet3AID) | Private subnet 3A ID in Availability Zone 3 |
| <a name="output_PrivateSubnet3ARouteTable"></a> [PrivateSubnet3ARouteTable](#output\_PrivateSubnet3ARouteTable) | Private subnet 3A route table |
| <a name="output_PrivateSubnet4ACIDR"></a> [PrivateSubnet4ACIDR](#output\_PrivateSubnet4ACIDR) | Private subnet 4A CIDR in Availability Zone 4 |
| <a name="output_PrivateSubnet4AID"></a> [PrivateSubnet4AID](#output\_PrivateSubnet4AID) | Private subnet 4A ID in Availability Zone 4 |
| <a name="output_PrivateSubnet4ARouteTable"></a> [PrivateSubnet4ARouteTable](#output\_PrivateSubnet4ARouteTable) | Private subnet 4A route table |
| <a name="output_PublicSubnet1CIDR"></a> [PublicSubnet1CIDR](#output\_PublicSubnet1CIDR) | Public subnet 1 CIDR in Availability Zone 1 |
| <a name="output_PublicSubnet1ID"></a> [PublicSubnet1ID](#output\_PublicSubnet1ID) | Public subnet 1 ID in Availability Zone 1 |
| <a name="output_PublicSubnet2CIDR"></a> [PublicSubnet2CIDR](#output\_PublicSubnet2CIDR) | Public subnet 2 CIDR in Availability Zone 2 |
| <a name="output_PublicSubnet2ID"></a> [PublicSubnet2ID](#output\_PublicSubnet2ID) | Public subnet 2 ID in Availability Zone 2 |
| <a name="output_PublicSubnet3CIDR"></a> [PublicSubnet3CIDR](#output\_PublicSubnet3CIDR) | Public subnet 3 CIDR in Availability Zone 3 |
| <a name="output_PublicSubnet3ID"></a> [PublicSubnet3ID](#output\_PublicSubnet3ID) | Public subnet 3 ID in Availability Zone 3 |
| <a name="output_PublicSubnet4CIDR"></a> [PublicSubnet4CIDR](#output\_PublicSubnet4CIDR) | Public subnet 4 CIDR in Availability Zone 4 |
| <a name="output_PublicSubnet4ID"></a> [PublicSubnet4ID](#output\_PublicSubnet4ID) | Public subnet 4 ID in Availability Zone 4 |
| <a name="output_PublicSubnetRouteTable"></a> [PublicSubnetRouteTable](#output\_PublicSubnetRouteTable) | Public subnet route table |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | VPC\_CIDR |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
