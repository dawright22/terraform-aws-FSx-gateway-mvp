######
# Collect data
######

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_vpc" "vpc" {
  filter {
    name   = "tag:Name"
    values = ["${var.name}_vpc"]
  }
}

data "aws_subnets" "public" {
  filter {
    name   = "tag:Name"
    values = ["${var.name}_public_subnets"]
  }
}

# data "aws_subnet_ids" "private" {
#   vpc_id = data.aws_vpc.vpc.id
# filter {
#     name   = "tag:Name"
#     values = ["${var.name}_private_subnets_A"]
#   }
# }


# resource "aws_fsx_windows_file_system" "myfsx" {
#   storage_capacity    = var.storage_capacity
#   deployment_type     = "MULTI_AZ_1"
#   subnet_ids          = data.aws_subnets.public.ids
#   preferred_subnet_id = data.aws_subnets.public.ids[0]
#   throughput_capacity = var.throughput_capacity

#   self_managed_active_directory {
#     dns_ips     = var.dns_ips
#     domain_name = var.domain_name
#     password    = var.password
#     username    = var.username
#   }
# }

resource "aws_storagegateway_gateway" "myfsx" {
  gateway_ip_address = var.gateway_ip_address
  gateway_name       = "${var.name}_myfsx"
  gateway_timezone   = var.timezone
  gateway_type       = var.gateway_type
  smb_active_directory_settings {
    domain_name        = var.domain_name
    password           = var.password
    username           = var.username
    domain_controllers = var.domain_controllers
  }
}

resource "aws_storagegateway_cache" "fsx" {
  disk_id     = data.aws_storagegateway_local_disk.fsx.disk_id
  gateway_arn = aws_storagegateway_gateway.myfsx.arn
}

data "aws_storagegateway_local_disk" "fsx" {
  gateway_arn = aws_storagegateway_gateway.myfsx.arn
  disk_path   = var.disk_path
}
