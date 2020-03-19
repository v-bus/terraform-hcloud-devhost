output "dev_vps" {
  value = {
            for hz in hcloud_server.ops-09 :                              
                hz.name => {                                                      # hcloud vps-name and hostname
                            "ipv4 address" = hz.ipv4_address                      # vps ipv4 address
                            "fqdn"         = element(aws_route53_record.vb_record, 
                                                    index(hcloud_server.ops-09, hz)
                                                    ).fqdn                        # vps fqdn
                            "vps status"   = hz.status                            # vps status
                            "root password"= element(random_password.password,
                                                   index(hcloud_server.ops-09, hz)
                                                    ).result                      # generated password
                          }       
          }
}
