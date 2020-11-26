variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
  }
resource "okta_app_group_assignment" "example" {
  app_id   = "0oa60cffqo3DIj6xV357"
  group_id = "00g5ah5x2jQkwtBns357"
}
