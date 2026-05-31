variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment name"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to all resources"
  type        = map(string)
  default     = {}
}

variable "ebs_addon_version" {
  description = "EBS CSI Driver Addon Version"
  type        = string
  
}

variable "cluster_log_types" {
  description = "The log types to enable for the EKS cluster"
  type        = list(string)
  default = [ "api", "audit", "authenticator", "controllerManager", "scheduler" ]
  
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  
}

variable "node_groups" {
  description = "The node groups for the EKS cluster"
  type = map(object({
    name           = string
    desired_size   = number
    min_size       = number
    max_size       = number
    instance_types = list(string)
    ami_type       = string
    disk_size      = number
    capacity_type  = string
    labels         = map(string)
  }))
}

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
