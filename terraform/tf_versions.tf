terraform {
  #The required_version setting can be used to require a specific version of Terraform.
  #If the running version of Terraform doesn't match the constraints specified, Terraform will show an error and exit.
  required_version = ">= 1.5.5"

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "= 4.79.0"
    }
    # kubernetes = {
    #   source  = "hashicorp/kubernetes"
    #   version = "~> 2.0"
    # }
  }
}
