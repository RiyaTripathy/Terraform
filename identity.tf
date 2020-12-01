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
data "okta_group" "FBImemberadmin_group" {
  name = "FBI Member Admin"
}
resource "okta_app_group_assignment" "test" {
  app_id   = data.okta_app.app_test.id
  group_id = data.okta_group.FBImember_group.id
}
resource "okta_app_group_assignment" "test1" {
  app_id   = data.okta_app.app_test.id
  group_id = data.okta_group.FBImemberadmin_group.id
}
data "okta_auth_server" "authserver_test" {
  name = "default"
}
resource "okta_auth_server_claim" "div_claim" {
  auth_server_id = data.okta_auth_server.authserver_test.id
  name           = "division_code"
  value_type     = "EXPRESSION"
  value          = "user.divisions"
  claim_type     = "RESOURCE"
}
resource "okta_auth_server_claim" "role_claim" {
  auth_server_id = data.okta_auth_server.authserver_test.id
  name           = "role"
  value_type     = "EXPRESSION"
  value          = "user.role_code"
  claim_type     = "RESOURCE"
}
resource "okta_auth_server_claim" "company_claim" {
  auth_server_id = data.okta_auth_server.authserver_test.id
  name           = "company_code"
  value_type     = "EXPRESSION"
  value          = "user.company"
  claim_type     = "RESOURCE"
}
data "okta_default_policy" "policy_test" {
  type = "OAUTH_AUTHORIZATION_POLICY"
}
resource "okta_auth_server_policy_rule" "rule_test" {
auth_server_id   = data.okta_auth_server.authserver_test.id
policy_id        = data.okta_default_policy.policy_test.id
name             = "Default Policy Rule"
access_token_lifetime_minutes = 2
}
resource "okta_auth_server_policy_rule" "rule_test" {
auth_server_id   = data.okta_auth_server.authserver_test.id
policy_id        = data.okta_default_policy.policy_test.id
name             = "Default Policy Rule"
grant_type_whitelist  = ["authorization_code","implicit","password",client_credentials]
priority         =  1
access_token_lifetime_minutes = 2
}
