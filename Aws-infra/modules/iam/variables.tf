variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}
variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default = {

    owner = "krishna"
  }
}
variable "enable_irsa" {
  description = "Enable IAM Roles for Service Accounts (IRSA)"
  type        = bool
  default     = true
}
variable "oidc_provider_url" {
  description = "OIDC Provider URL for the EKS cluster"
  type        = string

}

variable "ecr_repository_names" {
    type = list(string)
    default = [ "zen-pharma/api-gateway", "zen-pharma/drug-catalog-service", "zen-pharma/auth-service", "zen-pharma/inventory-service", "zen-pharma/manufacturing-service", "zen-pharma/notification-service", "zen-pharma/supplier-service", "zen-pharma/qc-service", "zen-pharma/pharma-ui" ]
}

# variable "service_accounts" {
#   description = "Map of service accounts and their configurations"
#   type = map(object({
#     namespace       = string
#     service_account = string
#     service_tag     = string
#     # Optional: Add custom policies per service
#     policy_arns     = optional(list(string), [])
#   }))
#   default = {
#     auth = {
#       namespace       = "zen-pharma"
#       service_account = "auth-service-sa"
#       service_tag     = "auth"
#     }
#     api-gateway = {
#       namespace       = "zen-pharma"
#       service_account = "api-gateway-sa"
#       service_tag     = "apigateway"
#     }
    
#   }
# }

