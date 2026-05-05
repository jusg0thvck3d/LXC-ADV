output "lxc_hostname" {
  value = proxmox_lxc.advanced.hostname
}

output "lxc_vmid" {
  value = proxmox_lxc.advanced.vmid
}

output "lxc_target_node" {
  value = proxmox_lxc.advanced.target_node
}

output "lxc_ip" {
  value = var.network_ip
}

output "lxc_description" {
  value = proxmox_lxc.advanced.description
}