# ---------------------------------------------------------------------------------------------------------------------
# PARAMETERS
# These parameters have reasonable defaults.
# ---------------------------------------------------------------------------------------------------------------------
variable "name" {
  description = "Name given resources"
  type        = string
  default     = "aws-quickstart"
}

variable "subnet_name" {
  description = "Name given resources"
  type        = string
  default     = "public_subnets"
}

variable "create_bastion" {
  description = "Create resource"
  type        = bool
  default     = true
}

variable "key_name" {
  type        = string
  description = "ssh key name"
}
