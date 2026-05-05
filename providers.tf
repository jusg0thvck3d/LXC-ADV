terraform {
  required_version = ">= 1.14.0"

  required_providers {
    vault = {
      source  = "hashicorp/vault"
      version = "~> 4.0"
    }

    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc07"
    }
  }
  # HCP Terraform cloud block removed from public template.
  # Add your own cloud block here if using HCP Terraform.


}

provider "vault" {
  address = var.vault_addr

  skip_child_token = true

  auth_login {
    path = "auth/approle/login"

    parameters = {
      role_id   = var.vault_approle_role_id
      secret_id = var.vault_approle_secret_id
    }
  }
}

data "vault_kv_secret_v2" "proxmox" {
  mount = var.vault_proxmox_secret_mount
  name  = var.vault_proxmox_secret_name
}

provider "proxmox" {
  pm_api_url          = data.vault_kv_secret_v2.proxmox.data["api_url"]
  pm_api_token_id     = data.vault_kv_secret_v2.proxmox.data["token_id"]
  pm_api_token_secret = data.vault_kv_secret_v2.proxmox.data["token_secret"]
  pm_tls_insecure     = var.proxmox_tls_insecure
}