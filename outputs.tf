output "public_ip" {
  value = oci_core_instance.test_vm_01.public_ip
}

output "bucket_tf" {
  value = {
    tf-format     = format("n/%s/b/%s", oci_objectstorage_bucket.tf_state.namespace, oci_objectstorage_bucket.tf_state.name)
    http-endpoint = format("https://%s.compat.objectstorage.%s.oraclecloud.com", oci_objectstorage_bucket.tf_state.namespace, var.region)
    bucket-name   = oci_objectstorage_bucket.tf_state.name
  }
}

output "bucket_namespace" {
  value = data.oci_objectstorage_namespace.bucket_namespace.namespace
}