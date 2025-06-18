output "public_ip" {
  value       = module.wireguard[0].public_ip
  description = "The public IP address of the WireGuard server"
}

output "private_key" {
  value       = module.wireguard[0].private_key
  sensitive   = true
  description = "The private key for the WireGuard server"
}

output "public_key" {
  value       = module.wireguard[0].public_key
  description = "The public key for the WireGuard server"
}

output "config" {
  value       = module.wireguard[0].config
  sensitive   = true
  description = "The WireGuard client configuration"
}
