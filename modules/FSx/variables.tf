variable "name" {
  description = "Name given resources"
  type        = string
  default     = "aws-IA"
}

variable "dns_ips" {
  type        = list(string)
  description = "A list of DNS IPs"
  default     = ["10.0.0.111", "10.0.0.222"]
}

variable "domain_name" {
  type        = string
  description = "The name of the region you wish to deploy into"
  default     = "corp.myfsx.com"
}

variable "storage_capacity" {
  type        = string
  description = "Storage capacity (GiB) of the file system"
  default     = "300"
}

variable "throughput_capacity" {
  type        = string
  description = "Throughput (megabytes per second) of the file system"
  default     = "1024"
}

variable "username" {
  type        = string
  description = "The user name for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain"
  default     = "Admin"
}

variable "password" {
  type        = string
  description = "The password for the service account on your self-managed AD domain that Amazon FSx will use to join to your AD domain"
  default     = "avoid-plaintext-passwords"
}

variable "timezone" {
  type        = string
  description = "Time zone for the gateway. The time zone is of the format GMT, GMT-hr:mm, or GMT+hr:mm."
  default     = "GMT"
}

variable "gateway_type" {
  type        = string
  description = " Type of the gateway"
  default     = "FILE_FSX_SMB"
}

variable "gateway_ip_address" {
  type        = string
  description = "IP Address of the FSx appliance in vSphere"
}

variable "disk_path" {
  default     = "/dev/sdb"
  type        = string
  description = "Path on the FSx appliance in vsphere where the cache disk resides on the OS"
}

variable "domain_controllers" {
  default     = []
  type        = list(any)
  description = "Comma separated list of domain controllers."
}
