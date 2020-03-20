output "dev_vps" {
  value = {
            hcloud_server.dev_vps.*.name =  hcloud_server.dev_vps.*.ipv4_address                     	} 
}
