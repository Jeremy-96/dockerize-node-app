terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}

provider "google" {
  project = "node-app-test-461405"
  region  = "europe-west1"
  zone    = "europe-west1"
}

data "google_iam_policy" "admin" {
  binding {
    role = "roles/artifactregistry.reader"
    members = [
      "user:jeremythonon96@hotmail.com"
    ]
  }
}

resource "google_artifact_registry_repository_iam_policy" "policy" {
  repository = google_artifact_registry_repository.demo_repo.name
  policy_data = data.google_iam_policy.admin.policy_data
}

resource "google_artifact_registry_repository" "demo_repo" {
  location = "europe-west1"
  repository_id = "demo-repo"
  description = "Demo Repository"
  format = "DOCKER"
}

