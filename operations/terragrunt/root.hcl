remote_state {
  backend = "gcs"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket   = "group-project-tf-state-${get_env("GCP_PROJECT_ID", "default")}"
    
    prefix   = "${path_relative_to_include()}/terraform.tfstate"
    
    project  = "nure-group-project"
    location = "europe-west1"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "google" {
  project = "nure-group-project"
  region  = "europe-west1"
}
EOF
}