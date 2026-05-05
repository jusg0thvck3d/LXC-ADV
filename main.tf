resource "proxmox_lxc" "advanced" {
  target_node = var.target_node
  hostname    = var.hostname
  vmid        = var.vmid

  ostemplate  = var.ostemplate
  password    = var.password
  description = var.description

  cores        = var.cores
  memory       = var.memory
  swap         = var.swap
  unprivileged = var.unprivileged

  start  = var.start
  onboot = var.onboot

  ssh_public_keys = var.ssh_public_keys

  nameserver   = var.nameserver
  searchdomain = var.searchdomain

  tags = var.tags

  rootfs {
    storage = var.rootfs_storage
    size    = var.rootfs_size
  }

  network {
    name   = var.network_name
    bridge = var.network_bridge
    ip     = var.network_ip
    gw     = var.network_gateway
    tag    = var.network_vlan_tag
  }

  features {
    nesting = var.enable_nesting
    fuse    = var.enable_fuse
    keyctl  = var.enable_keyctl
  }
}