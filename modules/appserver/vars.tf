variable "instance_name" {
  description = "The name of the Compute Engine instance"
  type        = string
}

variable "machine_type" {
  description = "The machine type of the Compute Engine instance"
  type        = string
}

variable "zone" {
  description = "The zone in which to create the Compute Engine instance"
  type        = string
}

variable "image" {
  description = "The image to use for the boot disk of the Compute Engine instance"
  type        = string
}

variable "startup_script" {
  description = "The startup script to run on the Compute Engine instance"
  type        = string
}
variable "subnet_name" {
  default = ""
}
variable "subnet_ip_cidr_range" {
  default = ""
}
variable "network_name" {
  default = "vpc1"
}