resource "oci_objectstorage_bucket" "tf_state" {
  compartment_id = var.compartment_ocid
  name           = "tf-state"
  namespace      = data.oci_objectstorage_namespace.bucket_namespace.namespace
  access_type    = "NoPublicAccess"
  defined_tags   = var.defined_tags
}