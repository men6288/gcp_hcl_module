module "worflows" {
    source = "./modules/workflow"
    project_name = "mnatalonipoc"
    project_id = "poc-personal-423321"
    labels = {"owner": "team-link", "service":"poc"}
    log_level = "DEBUG"
}