####################################
# Configure the Hetzner Cloud Provider
##########################
provider "hcloud" {
  token = var.hcloud_token
}
locals {
  devs = flatten([                                                                                                               # template begining          
            for k in range(length(var.vps_list)) :                                                                            # OS's names loop
                    [
                                                                                                                                # generate host pairs { "hostname" = "dev61-viktor-bushmin", "os" = "ubuntu" } 
                    for i in range(values(var.vps_list)[k]) : jsondecode(<<EOT
                                                                                {
                                                                                    "hostname" : "dev${k}${i}-${var.your_login}",
                                                                                    "os"    : "${keys(var.vps_list)[k]}"
                                                                                } 
                                                                            EOT
                                                                            )
                    ]
                ])
}
data "hcloud_image" "dev_image" {
  count       = length(var.vps_counts)
  name        = var.server_image[keys(var.vps_counts)[count.index]]
  most_recent = true
}

resource "hcloud_ssh_key" "vb_ssh_key" {
  name        = "vb_ssh"
  public_key  = file(var.vb_ssh_pub_path)
}

resource "hcloud_server" "ops-09" {
  count       = length(local.devs)
  name        = local.devs[count.index]["hostname"]
  image       = var.server_image[local.devs[count.index]["os"]]
  server_type = var.server_type
  ssh_keys    = [
                hcloud_ssh_key.vb_ssh_key.id	
                ] 
    provisioner "remote-exec" {
         inline       = [
                        "echo 'root:${random_password.password[count.index].result}' | chpasswd"
                      ]
        connection {
          type        = "ssh"
          user        = "root"
          host        = self.ipv4_address
          private_key = file(var.vb_ssh_pvt_path)
        }
    }               
}