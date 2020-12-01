variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
  }
data "okta_default_policy" "pwd_test" {
  type = "PASSWORD"
}
terraform import okta_policy_password.example 00p234t99mMdyjug8357

resource "okta_policy_password" "example" {
  name                   = "example"
  password_max_lockout_attempts = 5
  password_auto_unlock_minutes = 1440
    }
