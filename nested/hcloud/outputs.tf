output "dev_vps" {
  # value = jsondecode(
    value = {for host in hcloud_server.dev_vps : host.name => host.ipv4_address}
          
}
