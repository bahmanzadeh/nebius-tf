output "cluster_id" {
  value = nebius_mk8s_v1_cluster.k8s_cluster.id
}
output "kubeconfig_url" {
  value = "https://${var.storage_account_name}.blob.core.windows.net/${var.storage_container_name}/kubeconfig-${var.cluster_name}.yaml"
}