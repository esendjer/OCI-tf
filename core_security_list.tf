resource "oci_core_default_security_list" "default_security_list" {
  compartment_id = var.compartment_ocid
  defined_tags   = var.defined_tags
  display_name   = "Default Security List for main-vcn"
  egress_security_rules {
    description      = "Allows all outbound traffic"
    destination      = "0.0.0.0/0"
    destination_type = "CIDR_BLOCK"
    protocol         = "all"
    stateless        = "false"
  }
  ingress_security_rules {
    description = "Allows SHH from the Internet"
    protocol    = "6"
    source      = "0.0.0.0/0"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
    tcp_options {
      max = "22"
      min = "22"
    }
  }
  ingress_security_rules {
    description = "Allows ICMP traffic for: 3 Destination Unreachable"
    icmp_options {
      code = "-1"
      type = "3"
    }
    protocol    = "1"
    source      = "10.0.0.0/16"
    source_type = "CIDR_BLOCK"
    stateless   = "false"
  }
  freeform_tags              = {}
  manage_default_resource_id = oci_core_vcn.main_vcn.default_security_list_id
}