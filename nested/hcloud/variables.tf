variable "vps_list" { 
  description = "list of VPSs names should be the same as var.server_image. example {\"ubuntu_18\" = 2}"
  default = {
        "ubuntu_18" = 2
  }
} 
variable "dev_user" {
  description = "postfix in hostname like dev$N-username"
    default   = "username"
}

variable "hcloud_token" {
  description = "Access token to hcloud API"
}

variable "dev_ssh_pub_path" {
  description = "User public SSH RSA file path name"
  default     = "~/.ssh/id_rsa.pub"
}

variable "server_image" {
  description = "Hcloud image collection"
  default = {
            "ubuntu_16"     = "ubuntu-16.04"
            "debian_9"      = "debian-9"
            "centos_7"      = "centos-7"
            "ubuntu_18"     = "ubuntu-18.04"
            "debian_10"     = "debian-10"
            "centos_8"      = "centos-8"
            "fedora_31"     = "fedora-31"
          }
}
variable "server_type" {
  description = "hcloud server type"
  default     = "cx11"
}
