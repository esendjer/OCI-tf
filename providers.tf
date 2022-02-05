terraform {
  required_providers {
    oci = {
      source  = "hashicorp/oci"
      version = "~> 4.51.0"
    }
  }
  backend "s3" {
    bucket                      = "tf-state"
    key                         = "totalOracle/tf.tfstate"
    region                      = "eu-amsterdam-1"
    endpoint                    = ""
    shared_credentials_file     = "~/.oci/s3-creds"
    skip_region_validation      = true
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    force_path_style            = true
  }
}
