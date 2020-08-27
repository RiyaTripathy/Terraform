variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}
data "okta_users" "example" {
  search {
    name       = "status"
    value      = "DEPROVISIONED"
      comparison = "eq"
  }
}
