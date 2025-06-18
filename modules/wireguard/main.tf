module "wireguard" {
  count      = var.enable_wireguard ? 1 : 0
  source     = "github.com/nebius/nebius-solutions-library/modules/wireguard"
  parent_id  = var.parent_id
  zone_id    = var.zone_id
  network_id = var.network_id
}