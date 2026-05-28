output "db_secret_arn" {
  description = "ARN of the database credentials secret"
  value       = aws_secretsmanager_secret.db_credentials.arn
}

output "jwt_secret_arn" {
  description = "ARN of the JWT signing secret"
  value       = aws_secretsmanager_secret.jwt_secret.arn
}

output "db_username" {
  value       = jsondecode(aws_secretsmanager_secret_version.db_credentials.secret_string)["username"]
  description = "The database username stored in Secrets Manager"
  sensitive   = true 
}

output "db_password" {
  value       = jsondecode(aws_secretsmanager_secret_version.db_credentials.secret_string)["password"]
  description = "The database password stored in Secrets Manager"
  sensitive   = true 
}