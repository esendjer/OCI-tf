variable "config_file_profile" {
  type    = string
  default = "terraform"
}

variable "region" {
  default = "eu-amsterdam-1"
}

variable "image_build" {
  type    = string
  default = "2021.10.15-0"
}

variable "compartment_ocid" {
  default = ""
}

variable "vm_name" {
  type    = string
  default = "test-vm-01"
}

variable "ssh_pub_key" {
  type    = string
  default = ""
}

variable "shape" {
  type    = string
  default = "VM.Standard.E2.1.Micro"
}

variable "defined_tags" {
  type = map(string)
  default = {
    "Oracle-Tags.CreatedBy" = ""
    "Oracle-Tags.CreatedOn" = ""
  }
}
