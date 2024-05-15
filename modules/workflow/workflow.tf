locals {
  levels = {
    "DEBUG": "LOG_ALL_CALLS",
    "ERROR": "LOG_ERRORS_ONLY",
    "NONE": "LOG_NONE"
  }
}

resource "google_workflows_workflow" "my_workflow" {
  name        = "${var.project_name}-workflow"
  region      = var.region
  service_account = google_service_account.sa.id
  labels = var.labels
  project = var.project_id
  call_log_level = lookup(local.levels, var.log_level)

  source_contents = <<-EOT
    main:
      params: [args]
      steps:
        - init:
            assign:
              - project_id: ${var.project_id}
        - log_info:
            call: sys.log
            args:
              data: Hello World! project is ${var.project_id}
  EOT

  ## REFERENCE YAML via LINK ##
  # source_contents = data.http.workflow_yaml.body
}

## REFERENCE YAML via LINK ##
# data "http" "workflow_yaml" {
#   url = var.workflow_yaml_url
# }
