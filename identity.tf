variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}
resource "okta_group" "example" {
  name        = "Example"
  description = "My Example Group"
}
