variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
  }
 resource "okta_app_oauth" "example" {
  label                      = "TestLoginApp"
  type                       = "browser"
  grant_types                = ["authorization_code","implicit"]
  redirect_uris              = ["https://benchmark.dev.performanceroundtables.com/login/callback"]
  post_logout_redirect_uris  = ["https://benchmark.dev.performanceroundtables.com"]
  response_types             = ["code","token","id_token" ]
     }
