
provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}
#################################################
# define rebrain DNS public zone
#################################################
data "aws_route53_zone" "dns_dev_zone" {
  name         = var.dns_dev_zone
  private_zone = false
}

#################################################
# DNS record for developer's VPS 
#################################################
resource "aws_route53_record" "aws_dev_record" {
#################################################
# create count number of FQDN for developer's VPS
#################################################  
  count       = length(var.vps)
  zone_id     = data.aws_route53_zone.dns_dev_zone.zone_id
  name        = "${var.vps[count.index].name}.${data.aws_route53_zone.dns_dev_zone.name}"
  type        = "A"
  ttl         =  "300"
  records     = [
                var.vps[count.index].ipv4_address
            ]
}
