terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.52.0"
    }
  }
}

provider "databricks" {
  host  = var.databricks_host
  token = var.databricks_token
}

module "policies" {
  source = "./modules/policies"
}

module "clusters" {
  source        = "./modules/clusters"
  cluster_policy_all_purpose_id = module.policies.cluster_policy_all_purpose_id
}

module "jobs" {
  source        = "./modules/jobs"
  cluster_policy_jobs_id = module.policies.cluster_policy_jobs_id
  cluster_ids    = module.clusters.cluster_ids
}
