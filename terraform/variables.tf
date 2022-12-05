# core
variable "region" {
  description = "The AWS region to create the resources in."
  default     = "us-east-1"
}

# networking
variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "azs" {
  type        = list(string)
  description = "Availability zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

# rds

# variable "rds_db_name" {
#   description = "RDS database name"
#   default     = "mydb"
# }
# variable "rds_username" {
#   description = "RDS database username"
#   default     = "foo"
# }
# variable "rds_password" {
#   description = "RDS database password"
#   default     = "LongPredicatableTestPasswprd-22"
# }
# variable "rds_instance_class" {
#   description = "RDS instance type"
#   default     = "db.t3.micro"
# }