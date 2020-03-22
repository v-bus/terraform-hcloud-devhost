module "vps" {
  source       = "./nested/hcloud"
  vps_list     = var.vps_list
  dev_user     = var.dev_user
  hcloud_token = var.hcloud_token
}

module "dns" {
  source = "./nested/aws_route53"
  vps = module.vps.dev_vps
  aws_access_key = var.aws_access_key
  aws_secret_key = var.aws_secret_key
  dns_dev_zone   = var.dns_dev_zone
}
