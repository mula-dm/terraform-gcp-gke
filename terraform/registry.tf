# Create artifact registry
resource "google_artifact_registry_repository" "registry" {
  provider      = google
  location      = var.region
  repository_id = var.stack_name
  description   = var.stack_name
  format        = "DOCKER"
  labels        = local.tags
}
