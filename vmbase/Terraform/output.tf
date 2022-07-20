output "ec2-public-ip" {
  value = module.ec2_final_lab.public_ip
}

output "ec2-private-ip" {
    value = module.ec2_final_lab.private_ip
}

# output "alb-dns_name" {
#     value = module.alb
# }
