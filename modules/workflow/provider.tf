terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.29.1"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"   # Adjust the version if needed
    }
  }
}

provider "google" {
  project     = var.project_id
  region      = var.region
}