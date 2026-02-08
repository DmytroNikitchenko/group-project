resource "google_artifact_registry_repository" "repo" {
  provider      = google
  project       = var.project_id
  location      = var.region
  repository_id = var.repo_name
  description   = "Docker registry managed by Terragrunt"
  format        = "DOCKER"
}