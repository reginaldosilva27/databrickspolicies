terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.52.0"
    }
  }
}

resource "databricks_cluster_policy" "force_tags_and_spark_version_all_purpose" {
  name = "force-tags-and-spark-version-all_purpose"

  definition = <<EOF
{
  "cluster_type": {
    "type": "fixed",
    "value": "all-purpose"
  },
  "spark_version": {
    "type": "allowlist",
    "values": [
      "14.3.x-scala2.12"
    ]
  },
  "workload_type.clients.notebooks": {
    "type": "fixed",
    "value": true
  },
  "workload_type.clients.jobs": {
    "type": "fixed",
    "value": false
  },
  "instance_pool_id": { "type": "forbidden" },
  "runtime_engine": {
    "type": "fixed",
    "value": "PHOTON",
    "hidden": true
  },
  "node_type_id": {
    "type": "allowlist",
    "values": [
      "Standard_DS3_v2","Standard_DS4_v2"
    ],
    "defaultValue": "Standard_DS3_v2"
  },
  "driver_node_type_id": {
    "type": "allowlist",
    "values": [
      "Standard_DS3_v2"
    ],
    "defaultValue": "Standard_DS3_v2"
  },
  "num_workers": {
    "type": "range",
    "minValue": 1,
    "maxValue": 2,
    "defaultValue": 1
  },
  "autotermination_minutes": {
    "type": "fixed",
    "value": 20
  },
  "custom_tags.Environment": {
    "type": "fixed",
    "value": "DEV"
  },
  "custom_tags.Owner": {
    "type": "fixed",
    "value": "Terraform"
  }
}
EOF
}

resource "databricks_cluster_policy" "force_tags_and_spark_version_jobs" {
  name = "force-tags-and-spark-version-jobs"

  definition = <<EOF
{
  "cluster_type": {
    "type": "fixed",
    "value": "job"
  },
  "spark_version": {
    "type": "allowlist",
    "values": [
      "14.3.x-scala2.12"
    ]
  },
  "node_type_id": {
    "type": "allowlist",
    "values": [
      "Standard_DS3_v2"
    ],
    "defaultValue": "Standard_DS3_v2"
  },
  "driver_node_type_id": {
    "type": "allowlist",
    "values": [
      "Standard_DS3_v2"
    ],
    "defaultValue": "Standard_DS3_v2"
  },
  "num_workers": {
    "type": "range",
    "minValue": 1,
    "maxValue": 2,
    "defaultValue": 1
  },
  "custom_tags.Environment": {
    "type": "fixed",
    "value": "DEV"
  },
  "custom_tags.Owner": {
    "type": "fixed",
    "value": "Terraform"
  }
}
EOF
}

output "cluster_policy_all_purpose_id" {
  value = databricks_cluster_policy.force_tags_and_spark_version_all_purpose.id
}


output "cluster_policy_jobs_id" {
  value = databricks_cluster_policy.force_tags_and_spark_version_jobs.id
}


