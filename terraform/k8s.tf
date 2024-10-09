module "gke" {
  source                   = "./../modules/gke"
  project_id               = var.project_id
  name                     = var.stack_name
  region                   = var.region
  zones                    = var.zones
  network                  = var.network
  subnetwork               = join("-", [var.env, "k8s"])
  network_project_id       = var.network_project_id
  ip_range_pods            = "k8s-pod-range"
  ip_range_services        = "k8s-service-range"
  remove_default_node_pool = "true"
  cluster_resource_labels  = local.tags
  filestore_csi_driver     = true

  node_pools = [
    {
      name            = "default"
      machine_type    = "e2-small"
      min_count       = 0
      max_count       = 1
      local_ssd_count = 0
      disk_size_gb    = 30
      disk_type       = "pd-standard"
      image_type      = "COS_CONTAINERD"
      auto_repair     = true
      auto_upgrade    = true
      preemptible     = false
      service_account = google_service_account.service-account.email
    },
    {
      name            = "pool2"
      machine_type    = "e2-medium"
      min_count       = 0
      max_count       = 3
      local_ssd_count = 0
      disk_size_gb    = 30
      disk_type       = "pd-standard"
      image_type      = "COS_CONTAINERD"
      auto_repair     = true
      auto_upgrade    = true
      preemptible     = false
      service_account = google_service_account.service-account.email
    },
  ]
}
