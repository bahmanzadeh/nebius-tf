module "nfs_server" {
  source     = "github.com/nebius/nebius-solutions-library/modules/nfs-server"
  parent_id  = var.parent_id
  zone_id    = var.zone_id
  network_id = var.network_id
}