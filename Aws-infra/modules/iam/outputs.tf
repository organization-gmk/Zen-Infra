output "oidc_provider_id" {
  value = aws_iam_openid_connect_provider.eks.id
}
output "cluster_iam_role_arn" {
  description = "ARN of the EKS cluster IAM role"
  value       = aws_iam_role.cluster.arn
}

output "node_iam_role_arn" {
  description = "ARN of the EKS node IAM role"
  value       = aws_iam_role.node.arn
}


output "ebs_csi_driver_role_arn" {
  description = "ARN of the IAM role for EBS CSI Driver"
  value       = aws_iam_role.ebs_csi_driver.arn
}

output "rds_monitoring_role_arn" {
  description = "ARN of the IAM role for RDS Monitoring"
  value       = aws_iam_role.rds_monitoring.arn
}

output "aws_load_balancer_controller_arn" {
  description = "ARN of the IAM role for AWS Load Balancer Controller"
  value       = aws_iam_role.aws_load_balancer_controller.arn
}

output "cloudwatch_agent_role_arn" {
  description = "ARN of the IAM role for CloudWatch Agent & Fluent Bit"
  value       = aws_iam_role.cw_observability.arn
}

output "iam_cluster_autoscaler_arn" {
  description = "ARN of the IAM role for Cluster Autoscaler"
  value = aws_iam_role.cluster_autoscaler.arn
}

# output "auth_service_role_arn" {
#   value = aws_iam_role.irsa_roles["auth"].arn
# }


# output "api_gateway_role_arn" {
#   value = aws_iam_role.irsa_roles["api-gateway"].arn
# }
