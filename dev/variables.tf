variable "cloud_id" {}
variable "parent_id" {}
variable "sa_key" {}
variable "zone_id" {}
variable "network_id" {}
variable "ssh_user_name" {}
variable "ssh_public_key" {}

variable "cluster_name" {}
variable "k8s_version" { default = "1.28" }
variable "public_networking" { type = bool }

variable "cpu_nodes_count" { default = 1 }
variable "cpu_nodes_preset" { default = "16vcpu-64gb" }

variable "gpu_nodes_count" { default = 2 }
variable "gpu_nodes_preset" { default = "8gpu-128vcpu-1600gb" }

variable "storage_account_name" {}
variable "storage_container_name" {}

variable "enable_wireguard" { type = bool; default = false }
