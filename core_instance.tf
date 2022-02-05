resource "oci_core_instance" "test_vm_01" {
  availability_domain = data.oci_identity_availability_domains.availability_domains.availability_domains[0].name
  compartment_id      = var.compartment_ocid

  create_vnic_details {
    assign_public_ip = true
    subnet_id        = oci_core_subnet.main_subnet.id
  }

  display_name = var.vm_name

  metadata = {
    ssh_authorized_keys = var.ssh_pub_key
  }

  shape = var.shape
  source_details {
    source_id   = data.oci_core_images.os_images.images[0].id
    source_type = "image"
  }

  preserve_boot_volume = false

  defined_tags = var.defined_tags
}