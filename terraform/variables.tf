# Base settings
variable "org_id" {
  type        = string
  description = "The Org ID"
  default     = "xxxxxxxxxxxx"
}

variable "billing_account_id" {
  type        = string
  description = "The Org ID"
  default     = "xxxxxx-xxxxxx-xxxxxx"
}

variable "env" {
  type        = string
  description = "The project ID for deploy k8s cluster"
  default     = "dev"
}

variable "project_id" {
  type        = string
  description = "The project ID for deploy k8s cluster"
  default     = "test-project"
}

variable "network_project_id" {
  type        = string
  description = "The project ID of the shared VPC's host (for shared vpc support)"
  default     = "test-vpc"
}


variable "stack_name" {
  type    = string
  default = "k8s"
}

variable "zones" {
  type = list(string)
  # default = ["us-central1-a", "us-central1-b", "us-central1-c"]
  default = ["us-central1-a"]
}

variable "region" {
  type    = string
  default = "us-central1"
}

locals {
  tags = {
    "project"    = var.stack_name
    "created_by" = "terraform"
    "notes"      = "do_not_edit_it_manually"
  }
}

# k8s settings
variable "k8s_version" {
  type    = string
  default = "1.19.11"
}

variable "network" {
  type    = string
  default = "shared-k8s-vpc"
}

variable "sub_network_nodes" {
  type    = string
  default = "10.16.0.64/26"
}

variable "sub_network_services" {
  type    = string
  default = "10.0.1.0/24"
}

variable "sub_network_pods" {
  type    = string
  default = "10.20.16.0/20"
}

