variable "db_name" {
  description = "Name of the database to create"
  type        = string
}

variable "db_username" {
  description = "Database username to store in Secrets Manager"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database password to store in Secrets Manager"
  type        = string
  sensitive   = true
}

variable "jwt_secret" {
  description = "JWT signing secret to store in Secrets Manager"
  type        = string
  sensitive   = true
}

variable "env" {
  description = "Prefix for resource names"
  type        = string
}
variable "tags" {
  description = "Additional tags"
  type        = map(string)
  default = {
    owner = "krishna"
  }
}