data "oci_identity_availability_domains" "availability_domains" {
  compartment_id = var.compartment_ocid
}

data "oci_core_images" "os_images" {
  compartment_id = var.compartment_ocid
  filter {
    name   = "display_name"
    values = ["Canonical-Ubuntu-20.04-${var.image_build}"]
  }
}

data "oci_objectstorage_namespace" "bucket_namespace" {
  compartment_id = var.compartment_ocid
}