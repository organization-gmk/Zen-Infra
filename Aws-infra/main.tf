module "vpc" {
  source = "./modules/vpc"

  name_prefix            = local.name_prefix
  vpc_cidr               = var.vpc_cidr
  azs                    = local.azs
  project_name           = var.project_name
  enable_nat_gateway     = true
  one_nat_gateway_per_az = false
  tags = local.common_tags
}

module "iam" {
  source = "./modules/iam"

  name_prefix       = local.name_prefix
  oidc_provider_url = module.eks.cluster_oidc_issuer_url
 

  tags = local.common_tags
}

module "eks" {
  source = "./modules/eks"

  cluster_name          = local.cluster_name
  cluster_version        = var.cluster_version
  cluster_iam_role_arn  = module.iam.cluster_iam_role_arn
  subnet_ids            = module.vpc.private_subnets
  cluster_sg_id         = module.vpc.cluster_sg_id
  cluster_log_types     = var.cluster_log_types
  ebs_csi_driver_role   = module.iam.ebs_csi_driver_role_arn
  ebs_addon_version     = var.ebs_addon_version
  node_iam_role_arn     = module.iam.node_iam_role_arn
  node_groups           = var.node_groups
  cloudwatch_agent_role = module.iam.cloudwatch_agent_role_arn
  aws_load_balancer_controller_arn = module.iam.aws_load_balancer_controller_arn
  
  cluster_autoscaler_arn = module.iam.iam_cluster_autoscaler_arn
  
  tags                  = local.common_tags

 
}

module "secrets_manager" {
  source = "./modules/secrets-manager"

  env = local.env
  db_name = var.db_name
  db_username = var.db_username
  db_password = var.db_password
  jwt_secret = var.jwt_secret
  tags = local.common_tags
}

module "rds" {
  source = "./modules/rds"

  name_prefix = local.name_prefix
  env = local.env
  subnet_ids = module.vpc.private_subnets
  vpc_id = module.vpc.vpc_id
  eks_security_group_id = module.vpc.nodes_security_group_id
  db_name = var.db_name
  db_username = module.secrets_manager.db_username
  db_password = module.secrets_manager.db_password
  tags = local.common_tags
}