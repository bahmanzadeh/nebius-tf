output "cluster_id"        { value = module.cluster.cluster_id }
output "kubeconfig_url"    { value = module.cluster.kubeconfig_url }
output "cpu_group_id"      { value = module.cpu_nodes.cpu_node_group_id }
output "gpu_group_id"      { value = module.gpu_nodes.gpu_node_group_id }
output "nfs_server_ip"     { value = module.nfs.nfs_ip }
output "wireguard_ip"      { value = var.enable_wireguard ? module.wireguard[0].public_ip : null }
output "prometheus_url"    { value = "http://prometheus-server.monitoring.svc.cluster.local"}
output "grafana_url"       {value = "http://grafana.monitoring.svc.cluster.local"}
