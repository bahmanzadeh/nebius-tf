variable "cluster_name" {}
variable "network_id" {}
variable "zone_id" {}
variable "k8s_version" { default = "1.28" }
variable "public_networking" { type = bool }
variable "service_account_id" {}
variable "release_channel" { default = "STABLE" }
variable "log_group_id" {}
variable "labels" { type = map(string) }
variable "storage_account_name" {}
variable "storage_container_name" {}