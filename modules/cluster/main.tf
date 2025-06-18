resource "nebius_mk8s_v1_cluster" "k8s_cluster" {
  name       = var.cluster_name
  network_id = var.network_id
  master {
    version       = var.k8s_version
    public_ip     = var.public_networking
    zonal_master_config {
      zone = var.zone_id
    }
  }
  service_account_id     = var.service_account_id
  release_channel        = var.release_channel
  network_policy_provider = "CALICO"
  maintenance_policy {
    auto_upgrade = true
  }
  log_group_id = var.log_group_id
  labels       = var.labels
}

resource "local_file" "kubeconfig" {
  content  = nebius_mk8s_v1_cluster.k8s_cluster.kubeconfig
  filename = "${path.module}/kubeconfig-${var.cluster_name}.yaml"
}

resource "azurerm_storage_blob" "kubeconfig_blob" {
  name                   = "kubeconfig-${var.cluster_name}.yaml"
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
  type                   = "Block"
  source                 = local_file.kubeconfig.filename
  content_type           = "text/yaml"
}
