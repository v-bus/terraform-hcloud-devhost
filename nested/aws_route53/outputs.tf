output "dns_dev_records" {
		description = "list of maps with FQDN and ipv4_adress of dev host" 
		value = {
					"fqdn" = aws_route53_record. aws_dev_record.*.fqdn
					"ipv4_adress" = aws_route53_record. aws_dev_record.*.records[0]
					} 
} 