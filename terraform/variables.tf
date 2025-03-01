variable "esxi_hostname" {
  description = "ESXI server host name."
}

variable "esxi_hostport" {
  description = "ESXI server port."
}

variable "esxi_hostssl" {
  description = "ESXI server SSH port."
}

variable "esxi_username" {
  description = "ESXI server user name."
}

variable "esxi_password" { # Unspecified will prompt
  description = "ESXI server password."
  sensitive = true
}

variable "default_password" {
  type = string
  sensitive = true
}

variable "nodes" {
  type    = list(string)
  description = "Names of VMs to be create."
  # Example value.
  default = ["vm-k8s-sr01"]
}

variable "node_list" {
    type = list(string)
    default = ["vm-cihat"]
}

variable "ssh_public_key_path" {
  type = string
  description = "ssh public key which will set in guest OS for remote execute command."
}
variable "ssh_private_key_path" {
  type = string
  description = "ssh private key which will use to remote execute command."
  sensitive = true
}
variable "default-ssh-user" {
  type = string
  default = "ubuntu"
}
variable "ssh_public_key" {
  type = string
  default = ""
}
variable "ssh_private_key" {
  type = string
  default = ""
}
variable "esxi_vm_guest_default_settings" {
  type = object({
    numvcpus        = number
    memsize         = number
    boot_disk_size  = number
    disk_store      = string
    virtual_network = string
  })
  default = {
    numvcpus        = 4
    memsize         = 8192
    boot_disk_size  = 40
    disk_store      = "SSD"
    virtual_network = "Testnetwork"
  }
}

provider "esxi" {
  esxi_hostname = var.esxi_hostname
  esxi_hostport = var.esxi_hostport
  esxi_hostssl  = var.esxi_hostssl
  esxi_username = var.esxi_username
  esxi_password = var.esxi_password
}
