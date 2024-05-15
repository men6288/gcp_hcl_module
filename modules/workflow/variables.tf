variable "project_name" {
  type = string
  description = "Name that you want to call the project resources."
}

variable "project_id" {
  type = string
  description = "Project Id that you wish to add the workflows to."
}

variable "region" {
    type = string
    description = "Region that you wish to add the workflows to."
    default = "us-east1"
}

variable "labels" {
  type = map(string)
  description = "Tags that you wish to add to the workflow."
  default = null
}

variable "log_level" {
  type = string
  description = "Logging Level for Module."
  validation {
    condition     = contains(["NONE", "DEBUG", "ERROR"], var.log_level)
    error_message = "Valid values for environment are 'NONE', 'DEBUG', or 'ERROR'."
  }
  default = "NONE"
}

## REFERENCE YAML via LINK ##
# variable "workflow_yaml_url" {
#   type = string
#   description = "Url where the workflow yaml is stored."
#   default = null
# }