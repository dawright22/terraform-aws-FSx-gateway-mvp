# ----------------------------------------------------------------------------------------------------------------------
# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
# This module has been updated with 0.12 syntax, which means it is no longer compatible with any versions below 0.12.
# ----------------------------------------------------------------------------------------------------------------------
######################################
# Defaults
######################################

resource "random_pet" "name" {
  prefix = "aws-IA"
  length = 1
}

######################################
# Create VPC
######################################

module "quickstart_vpc" {
  source            = "./modules/quickstart_vpc"
  name              = random_pet.name.id
  cidr              = "10.0.0.0/16"
  public_subnets    = ["10.0.0.0/24", "10.0.1.0/24"]
  private_subnets_A = ["10.0.2.0/24", "10.0.3.0/24"]
  region            = var.region
}

######################################
# Create Bastion host
######################################
module "bastion" {
  depends_on     = [module.quickstart_vpc]
  source         = "./modules/jumphost"
  create_bastion = false
  name           = random_pet.name.id
  key_name       = ""
}
# ######################################
# # Create FSx  File Gateway
# ######################################
module "FSx" {
  depends_on         = [module.vsphere]
  source             = "./modules/FSx"
  name               = random_pet.name.id
  gateway_ip_address = module.vsphere.vm_ip
  domain_name        = "corp.local"
  dns_ips            = ["172.16.11.232"]
  username           = "administrator"
  password           = "VMware123!"
  domain_controllers = ["172.16.11.232"]
}

# ######################################
# # Create OVF ESXi  File Gateway
# ######################################
module "vsphere" {
  source     = "./modules/FSx_vmware"
  datastore  = "ESXi2-SSD"
  datacenter = "Black Mesa"
  network    = "Management-VL11"
  cluster    = "Compute"
  host       = "esxi2.bmrf.io"
  name       = "${random_pet.name.id}-gateway"
}
