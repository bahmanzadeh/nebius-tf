module "cluster" {
  source                  = "../modules/cluster"
  cluster_name            = var.cluster_name
  network_id              = var.network_id
  zone_id                 = var.zone_id
  k8s_version             = var.k8s_version
  public_networking       = var.public_networking
  service_account_id      = var.sa_key
  release_channel         = "STABLE"
  log_group_id            = ""
  labels                  = { env = "dev" }
  storage_account_name    = var.storage_account_name
  storage_container_name  = var.storage_container_name
}

module "cpu_nodes" {
  source         = "../modules/cpu_nodes"
  cluster_id     = module.cluster.cluster_id
  cpu_platform   = local.cpu_nodes_platform
  zone           = var.zone_id
  min_nodes      = var.cpu_nodes_count
  max_nodes      = var.cpu_nodes_count
  cpu_memory     = tonumber(split("vcpu-", var.cpu_nodes_preset)[1])
  cpu_cores      = tonumber(split("vcpu64gb", var.cpu_nodes_preset)[0])
  k8s_version    = var.k8s_version
}

module "gpu_nodes" {
  source               = "../modules/gpu_nodes"
  cluster_id           = module.cluster.cluster_id
  gpu_platform         = local.gpu_nodes_platform
  zone                 = var.zone_id
  min_gpu_replicas     = local.min_gpu_replicas
  max_gpu_replicas     = local.max_gpu_replicas
  gpu_memory           = 160  # per preset
  gpu_cores            = 128  # per preset
  gpus                 = tonumber(regex("\\d+", var.gpu_nodes_preset))
  k8s_version          = var.k8s_version
}

module "nfs" {
  source     = "../modules/nfs"
  parent_id  = var.parent_id
  zone_id    = var.zone_id
  network_id = var.network_id
}

module "wireguard" {
  source           = "../modules/wireguard"
  parent_id        = var.parent_id
  zone_id          = var.zone_id
  network_id       = var.network_id
  enable_wireguard = var.enable_wireguard
}