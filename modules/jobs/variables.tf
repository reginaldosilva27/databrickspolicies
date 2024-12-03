variable "cluster_policy_jobs_id" {
  description = "Cluster policy ID"
  type        = string
}

variable "cluster_ids" {
  description = "Cluster IDs for job execution"
  type        = list(string)
}
