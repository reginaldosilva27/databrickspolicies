terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.52.0"
    }
  }
}

resource "databricks_cluster" "all_purpose" {
  count = 5

  cluster_name            = "all_purpose_cluster_${count.index + 1}"
  spark_version           = "14.3.x-scala2.12"
  node_type_id            = "Standard_DS3_v2"
  runtime_engine          = "PHOTON"
  autotermination_minutes = 20
  policy_id               = var.cluster_policy_all_purpose_id
  num_workers = 1
}

output "cluster_ids" {
  value = [for cluster in databricks_cluster.all_purpose : cluster.id]
}
