data "google_compute_network" "vpc" {
  name    = var.network
  project = var.network_project_id
}

data "google_compute_subnetwork" "k8s" {
  name      = "k8s"
  project   = var.network_project_id
  region    = var.region
  self_link = "https://www.googleapis.com/compute/v1/projects/vpc-host/regions/us-central1/subnetworks/k8s"

}

resource "google_compute_subnetwork" "k8s" {
  name          = join("-", [var.env, "k8s"])
  project       = var.network_project_id
  ip_cidr_range = var.sub_network_nodes
  region        = var.region
  network                  = var.network
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "k8s-pod-range"
    ip_cidr_range = var.sub_network_pods
  }
  secondary_ip_range {
    range_name    = "k8s-service-range"
    ip_cidr_range = var.sub_network_services
  }
}
