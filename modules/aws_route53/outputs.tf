output "dns_dev_records" {
		description = "maps of FQDN => ipv4_adress of dev host" 
		value = {
					for dns_record in aws_route53_record.aws_dev_record : dns_record.fqdn => tolist(dns_record.records)[0]
				} 
} 