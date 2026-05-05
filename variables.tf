# ---------------------------
# Vault connection
# ---------------------------

variable "vault_addr" {
  type        = string
  description = "Vault server address. Use LAN address for local Terraform CLI."
}

variable "vault_approle_role_id" {
  type        = string
  sensitive   = true
  description = "Vault AppRole role_id for Terraform."
}

variable "vault_approle_secret_id" {
  type        = string
  sensitive   = true
  description = "Vault AppRole secret_id for Terraform."
}

variable "vault_proxmox_secret_mount" {
  type        = string
  default     = "secret"
  description = "Vault KV v2 mount path."
}

variable "vault_proxmox_secret_name" {
  type        = string
  default     = "proxmox"
  description = "Vault KV v2 secret name for Proxmox credentials."
}

# ---------------------------
# Proxmox provider settings
# ---------------------------

variable "proxmox_tls_insecure" {
  type        = bool
  default     = true
  description = "Use true if Proxmox uses an internal or self-signed certificate."
}

# ---------------------------
# Proxmox LXC identity
# ---------------------------

variable "target_node" {
  type        = string
  description = "Proxmox node where the LXC will be created."
}

variable "hostname" {
  type        = string
  description = "Container hostname."
}

variable "vmid" {
  type        = number
  default     = null
  description = "Optional Proxmox VMID. If null, Proxmox/Terraform can auto-assign."
}

variable "description" {
  type        = string
  default     = "Terraform-managed advanced LXC."
  description = "Container description shown in Proxmox."
}

# ---------------------------
# Proxmox LXC source
# ---------------------------

variable "ostemplate" {
  type        = string
  description = "Container OS template. Example: local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
}

variable "password" {
  type        = string
  sensitive   = true
  default     = null
  description = "Optional root password. Prefer SSH keys."
}

variable "ssh_public_keys" {
  type        = string
  sensitive   = true
  default     = null
  description = "Public SSH key string added to the container."
}

# ---------------------------
# Compute resources
# ---------------------------

variable "cores" {
  type        = number
  default     = 1
  description = "CPU cores assigned to the LXC."
}

variable "memory" {
  type        = number
  default     = 1024
  description = "Memory in MB."
}

variable "swap" {
  type        = number
  default     = 512
  description = "Swap in MB."
}

variable "unprivileged" {
  type        = bool
  default     = true
  description = "Create an unprivileged LXC."
}

variable "start" {
  type        = bool
  default     = true
  description = "Start container after creation."
}

variable "onboot" {
  type        = bool
  default     = true
  description = "Start container on Proxmox node boot."
}

# ---------------------------
# Root filesystem
# ---------------------------

variable "rootfs_storage" {
  type        = string
  default     = "local-lvm"
  description = "Storage pool for root filesystem."
}

variable "rootfs_size" {
  type        = string
  default     = "8G"
  description = "Root filesystem size."
}

# ---------------------------
# Network
# ---------------------------

variable "network_name" {
  type        = string
  default     = "eth0"
  description = "Container network interface name."
}

variable "network_bridge" {
  type        = string
  default     = "vmbr0"
  description = "Proxmox bridge."
}

variable "network_ip" {
  type        = string
  description = "Container IP with CIDR. Example: 192.168.10.50/24"
}

variable "network_gateway" {
  type        = string
  description = "Default gateway."
}

variable "network_vlan_tag" {
  type        = number
  default     = -1
  description = "VLAN tag. Use -1 for untagged."
}

variable "nameserver" {
  type        = string
  default     = null
  description = "Optional DNS server."
}

variable "searchdomain" {
  type        = string
  default     = null
  description = "Optional DNS search domain."
}

# ---------------------------
# LXC features
# ---------------------------

variable "enable_nesting" {
  type        = bool
  default     = false
  description = "Enable nesting. Useful for Docker or nested container workloads."
}

variable "enable_fuse" {
  type        = bool
  default     = false
  description = "Enable FUSE."
}

variable "enable_keyctl" {
  type        = bool
  default     = false
  description = "Enable keyctl."
}

# ---------------------------
# Tags
# ---------------------------

variable "tags" {
  type        = string
  default     = "terraform"
  description = "Tags shown in Proxmox. Usually semicolon-separated."
}