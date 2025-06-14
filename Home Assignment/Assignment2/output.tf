# output "web_server_ids" {
#     description = "IDs of all EC2 instances created by the module"
#     value       = module.priyesh-webapplication.id
# }

# output "web_server_public_ips" {
#     description = "Public IPs of all EC2 instances created by the module"
#     value       = module.priyesh-webapplication.public_ip
# }

# =============================================================================

#list of instance IDs
output "web_server_ids" {
    description = "IDs of all EC2 instances created by the module"
    value       = [for instance in module.priyesh-webapplication : instance.id]
}

#list of public IPs
output "web_server_public_ips" {
    description = "Public IPs of all EC2 instances created by the module"
    value       = [for instance in module.priyesh-webapplication : instance.public_ip]
}
