variable "vsphere_data_center" {
    type = string
    description = "Datacenter name"
    }
variable "vsphere_cluster" {
    type = string
    description = "Cluster name"
    }
variable "vsphere_workload_datastore" {
    type = string
    description = "Datastore name"
    }
variable "vsphere_compute_pool" {
    type = string
    description = "Compute Pool name"
    }
variable "vsphere_network" {
    type = string
    description = "vSphere network name"
    }
variable "vsphere_resource_pool" {
    type = string
    description = "Resource Pool name"
    }
variable "vsphere_user" {
    type = string
    description = "vSphere user"
    }
variable "vsphere_password" {
    type = string
    description = "vSphere password!"
    }
variable "vsphere_vcenter" {
    type = string
    description = "vCenter Server IP or DNS"
    }