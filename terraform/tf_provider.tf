# https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/provider_reference.html#credentials-1
provider "google" {
  project = var.project_id
  region  = var.region
}
