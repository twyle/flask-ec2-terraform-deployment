output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.dev_node.public_ip
}

# output "rds_endpoint" {
#   description = "The connection endpoint"
#   value       = aws_db_instance.production.endpoint
# }

# output "rds_hostname" {
#   description = "RDS instance hostname"
#   value       = aws_db_instance.production.address
#   sensitive   = true
# }

# output "rds_port" {
#   description = "RDS instance port"
#   value       = aws_db_instance.production.port
#   sensitive   = true
# }

# output "rds_username" {
#   description = "RDS instance root username"
#   value       = aws_db_instance.production.username
#   sensitive   = true
# }