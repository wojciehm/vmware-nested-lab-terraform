provider "vsphere" {
  user                  = var.vsphere_user
  password              = var.vsphere_password
  vsphere_server        = var.vsphere_vcenter
  allow_unverified_ssl  = true
  version               = ">=1.20.0"
}
module "deploy-esxi1" {
    source = "./modules/deploy-esxi1"
}
module "deploy-esxi2" {
    source = "./modules/deploy-esxi2"
}
module "deploy-esxi3" {
    source = "./modules/deploy-esxi3"
}