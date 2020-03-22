variable "aws_access_key" {
 description = "required: AWS Access Key" 
}
variable "aws_secret_key" {
 description = "required: AWS Secret Key" 
}
variable "dns_dev_zone" {
 description = "required: public DNS zone" 
}
variable "vps_list" { 
  description = "list of VPSs names should be the same as var.server_image. example {\"ubuntu_18\" = 2}"
  type = map(any)
} 
variable "dev_user" {
  description = "postfix in hostname like dev$N-username"
}
variable "hcloud_token" {
  description = "Access token to hcloud API"
}