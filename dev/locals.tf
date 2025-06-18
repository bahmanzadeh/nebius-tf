locals {
  cpu_nodes_platform = var.cpu_nodes_preset
  gpu_nodes_platform = var.gpu_nodes_preset
  min_gpu_replicas   = var.gpu_nodes_count
  max_gpu_replicas   = var.gpu_nodes_count
}