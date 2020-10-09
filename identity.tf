variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}
resource "okta_user_schema" "fbi_user" {
  index       = "attr"
  title       = "attr"
  type        = "string"
  description = "My custom property name"
  master      = "OKTA"
  scope       = "SELF"
    }
