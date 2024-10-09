#Create service account
resource "google_service_account" "service-account" {
  provider     = google
  account_id   = var.stack_name
  display_name = var.stack_name
  project      = var.project_id
  description  = var.stack_name
}

#Create service account key
resource "google_service_account_key" "key" {
  service_account_id = google_service_account.service-account.name
}

# Add permissions to the artifact registry for service account
resource "google_artifact_registry_repository_iam_member" "iam" {
  provider   = google
  location   = google_artifact_registry_repository.registry.location
  repository = google_artifact_registry_repository.registry.name
  role       = "roles/artifactregistry.writer"
  member     = "serviceAccount:${google_service_account.service-account.email}"
}

# Create iam role on shared vpc project
# it need for use internal services on k8s cluster
resource "google_project_iam_custom_role" "host_project_network_security_admin" {
  project     = var.network_project_id
  role_id     = join("_", [var.env, "host_project_network_security_admin"])
  title       = join(" ", ["Custom", var.project_id, "host project network security admin"])
  description = "Created Automaticaly By Terraform. Do not edit it manually! This role allows to administer network and security of the host project. Intended for use by GKE automation on service projects."
  permissions = ["compute.firewalls.create", "compute.firewalls.delete", "compute.firewalls.get", "compute.firewalls.list", "compute.firewalls.update", "compute.networks.updatePolicy"]
}


# Apply "host_project_network_security_admin" role to a Service Account used by GKE's automation.
# it need for use internal services
resource "google_project_iam_binding" "project" {
  project = var.network_project_id
  role    = google_project_iam_custom_role.host_project_network_security_admin.id
  members = [
    join("", ["serviceAccount:", "service-", data.google_project.current.number, "@container-engine-robot.iam.gserviceaccount.com"]),
  ]
}
