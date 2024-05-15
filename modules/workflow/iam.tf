resource "google_service_account" "sa" {
  account_id   = "${var.project_name}-serviceaccount"
  display_name = "Service Account for Workflow Module"
}

resource "google_project_iam_custom_role" "workflow_execution_role" {
  title       = "${var.project_name}_role"
  description = "This role allows access to my workflow resources."
  permissions = [
        "workflows.callbacks.list",
        "workflows.callbacks.send",
        "workflows.executions.cancel",
        "workflows.executions.create",
        "workflows.executions.get",
        "workflows.executions.list",
        "workflows.stepEntries.get",
        "workflows.stepEntries.list",
        "logging.logEntries.create",
        "logging.logEntries.route"
  ]
  role_id = "${random_string.hex_string.result}_role"
}

resource "google_project_iam_member" "sa_workflow_member" {
  project = var.project_id
  role    = google_project_iam_custom_role.workflow_execution_role.name
  member  = "serviceAccount:${google_service_account.sa.email}"
}

resource "google_project_iam_binding" "binding_sa" {
  project = var.project_id
  role    = google_project_iam_custom_role.workflow_execution_role.name
  members = [
    "serviceAccount:${google_service_account.sa.email}"
  ]
}



