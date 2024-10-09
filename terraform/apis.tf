# enable neccesary api on gcp project
# https://registry.terraform.io/modules/terraform-google-modules/project-factory/google/latest/submodules/project_services
module "project-services" {
  source                      = "./../modules/gcp_cloud/modules/project_services"
  project_id                  = var.project_id
  disable_services_on_destroy = false
  activate_apis = [
    "compute.googleapis.com",   # Compute Engine API, need for create vpc
    "container.googleapis.com", # Kubernetes Engine API
  ]
}

module "project-services-vpc" {
  source                      = "./../modules/gcp_cloud/modules/project_services"
  project_id                  = var.network_project_id
  disable_services_on_destroy = false
  activate_apis = [
    "container.googleapis.com", # Kubernetes Engine API
  ]
}
