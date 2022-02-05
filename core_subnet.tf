resource "oci_core_subnet" "main_subnet" {
  cidr_block      = "10.0.0.0/24"
  compartment_id  = var.compartment_ocid
  defined_tags    = var.defined_tags
  dhcp_options_id = oci_core_vcn.main_vcn.default_dhcp_options_id
  display_name    = "main-subnet"
  dns_label       = "mainsubnet"
  freeform_tags   = {}

  prohibit_internet_ingress  = "false"
  prohibit_public_ip_on_vnic = "false"
  route_table_id             = oci_core_vcn.main_vcn.default_route_table_id
  security_list_ids          = [oci_core_vcn.main_vcn.default_security_list_id]
  vcn_id                     = oci_core_vcn.main_vcn.id
}

resource "oci_core_vcn" "main_vcn" {
  cidr_blocks    = ["10.0.0.0/16"]
  compartment_id = var.compartment_ocid
  defined_tags   = var.defined_tags
  display_name   = "main-vcn"
  dns_label      = "mainvcn"
  freeform_tags  = {}
}

resource "oci_core_default_dhcp_options" "default_dhcp" {
  compartment_id             = var.compartment_ocid
  defined_tags               = var.defined_tags
  display_name               = "Default DHCP Options for main-vcn"
  domain_name_type           = "CUSTOM_DOMAIN"
  freeform_tags              = {}
  manage_default_resource_id = oci_core_vcn.main_vcn.default_dhcp_options_id
  options {
    custom_dns_servers = []
    server_type        = "VcnLocalPlusInternet"
    type               = "DomainNameServer"
  }
  options {
    search_domain_names = ["mainvcn.oraclevcn.com"]
    type                = "SearchDomain"
  }
}

resource "oci_core_default_route_table" "default_route_table" {
  compartment_id = var.compartment_ocid
  defined_tags   = var.defined_tags
  display_name   = "Default Route Table for main-vcn"
  freeform_tags = {
  }
  manage_default_resource_id = oci_core_vcn.main_vcn.default_route_table_id
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.main_internet.id
  }
}