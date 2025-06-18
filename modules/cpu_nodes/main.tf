resource "nebius_mk8s_v1_node_group" "cpu_nodes" {
  cluster_id  = var.cluster_id
  name        = "cpu-node-group"
  platform_id = var.cpu_platform
  version     = var.k8s_version
  scale_policy {
    auto_scale {
      min = var.min_nodes
      max = var.max_nodes
    }
  }
  node_template {
    resources {
      cores  = var.cpu_cores
      memory = var.cpu_memory
    }
    scheduling_policy {
      preemptible = true
    }
    zone = var.zone
  }
}