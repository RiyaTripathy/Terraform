variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
}
resource "okta_user_schema" "example" {
  index       = "test"
  title       = "test"
  type        = "string"
  description = "My custom property name"
  master      = "OKTA"
  scope       = "SELF"
    }
