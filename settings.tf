# Configure the AWS Provider
provider "aws" {
  region = var.region
}

# Configure the AWS Provider
provider "awscc" {
  region = var.region
}

provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = "VMware123!"
  vsphere_server       = "vc.bmrf.io"
  allow_unverified_ssl = true
}
