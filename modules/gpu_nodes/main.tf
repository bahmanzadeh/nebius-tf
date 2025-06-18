resource "nebius_mk8s_v1_node_group" "gpu_nodes" {
  cluster_id  = var.cluster_id
  name        = "gpu-node-group"
  platform_id = var.gpu_platform
  version     = var.k8s_version
  scale_policy {
    auto_scale {
      min = var.min_gpu_replicas
      max = var.max_gpu_replicas
    }
  }
  node_template {
    resources {
      cores  = var.gpu_cores
      memory = var.gpu_memory
      gpus   = var.gpus
    }
    zone = var.zone
  }
}