variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
  }

resource "okta_template_email" "example1" {
  type = "email.forgotPassword"

  translations {
    language = "en"
    subject  = "Riya Password Reset "
    template = "Hi $${user.firstName},<br/><br/>Blh blah $${resetPasswordLink}"
  }
    }

resource "okta_group" "example" {
  name        = "Example1"
  description = "My Example Group"
}
