variable "vps" {
description = "list of maps with hostname and ips" 
default = [
				{"name" = "localhost"
				 "ipv4_address" = "127.0.0.1"
				},
				] 
} 
variable "dns_dev_zone" {
    description	 = "public DNS zone" 
    default			 = "dev.yourdomain.net."
}

variable "aws_region" {
     description = "optional: default aws provider region will fail if you dont have " 
    default = "eu-central-1"
}

variable "aws_access_key" {
description = "required: AWS Access Key" 
}

variable "aws_secret_key" {
description = "required: AWS Secret Key" 
}