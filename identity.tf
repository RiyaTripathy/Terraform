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

  resource "okta_group" "FBImember_group" {
  name        = "FBI Member"
  description = "FBI Member with role code EXT1"
}

resource "okta_group" "FBImemberadmin_group" {
  name        = "FBI Member Admin"
  description = "FBI Member Admin with role code EXT2"
}
data "okta_app" "app_test" {
  label = "TestLoginApp"
}
data "okta_group" "FBImember_group" {
  name = "FBI Member"
}
resource "okta_app_group_assignment" "test" {
  app_id   = data.okta_app.app_test.id
  group_id = data.okta_group.FBImember_group.id
}
