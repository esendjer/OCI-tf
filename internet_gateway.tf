resource "oci_core_internet_gateway" "main_internet" {
  compartment_id = var.compartment_ocid
  defined_tags   = var.defined_tags
  display_name   = "Internet Gateway main-vcn"
  enabled        = "true"
  freeform_tags = {
  }
  vcn_id = oci_core_vcn.main_vcn.id
}