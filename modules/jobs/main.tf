terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "1.52.0"
    }
  }
}

resource "databricks_job" "simple_notebook_job" {
  count = 10

  name = "simple_notebook_job_${count.index + 1}"

  job_cluster {
    new_cluster {
      spark_version      = "14.3.x-scala2.12"
      runtime_engine     = "STANDARD"
      num_workers        = 1
      node_type_id       = "Standard_DS3_v2"
      data_security_mode = "SINGLE_USER"
      policy_id    = var.cluster_policy_jobs_id
    }
    job_cluster_key = "job_cluster"
  }

  task {
    task_key = "task_teste"
    job_cluster_key = "job_cluster"
    notebook_task {
      notebook_path = "/Workspace/Users/reginaldo.silva27@hotmail.com/terraform_policies"
    }
  }
}
