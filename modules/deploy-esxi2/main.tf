data "vsphere_datacenter" "datacenter" {
  name          = var.vsphere_data_center
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_workload_datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "vmFromLocalOvf" {
  name = var.lab-esxi02
  folder = "terraform"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id = data.vsphere_datastore.datastore.id
  datacenter_id = data.vsphere_datacenter.datacenter.id
  host_system_id = data.vsphere_host.host.id

  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout = 0

  ovf_deploy {
    local_ovf_path = "/Users/wmarusiak/Downloads/Nested_ESXi7.0_Appliance_Template_v1.ova"
    disk_provisioning = "thin"
    ip_protocol          = "IPV4"
    ip_allocation_policy = "STATIC_MANUAL"
    ovf_network_map = {
        "VM Network" = data.vsphere_network.network.id
    }
  }

  vapp {
    properties = {
      "guestinfo.hostname" = "lab01-esxi01",
      "guestinfo.ipaddress" = "192.168.2511.10",
      "guestinfo.netmask" = "255.255.255.0",
      "guestinfo.gateway" = "192.168.251.1",
      "guestinfo.dns" = "192.168.255.220",
      "guestinfo.domain" = "homelab01.local",
      "guestinfo.ntp" = "pool.ntp.org",
      "guestinfo.password" = "VMware1!",
      "guestinfo.ssh" = "True"
    }
  }
}