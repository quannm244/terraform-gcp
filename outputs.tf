# output "public_ip" {
#     value = module.cloudsql.public_ip
# }

# output "network" {
#     value = module.vpc.network
# }

# output "subnets" {
#     value = module.subnets.subnetwork
# }

output "vm_public_ip" {
  value = module.gce.vm_public_ip
}