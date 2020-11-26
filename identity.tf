variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
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
