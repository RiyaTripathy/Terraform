variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
  }
data "okta_group" "FBImember_group" {
  name = "FBI Member"
}
data "okta_group" "FBImemberadmin_group" {
  name = "FBI Member Admin"
}
resource "okta_policy_mfa" "mfa_test" {
  name        = "MZ FBI MFA"

  okta_otp = {
    enroll = "OPTIONAL"
  }
    okta_question = {
    enroll = "OPTIONAL"
  }
    okta_sms = {
    enroll = "OPTIONAL"
  }
    okta_push = {
    enroll = "OPTIONAL"
  }
    okta_password = {
    enroll = "OPTIONAL"
  }

  groups_included = ["${data.okta_group.FBImember_group.id}","${data.okta_group.FBImemberadmin_group.id}"]
}
