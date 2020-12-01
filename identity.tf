variable "org_name" {}
variable "api_token" {}
variable "base_url" {}

provider "okta" {
    org_name = var.org_name
    base_url = var.base_url
    api_token = var.api_token
  }
resource "okta_template_email" "example" {
  type = "email.forgotPassword"

  translations {
    language = "en"
    subject  = "Riya Password Reset"
    template = "<div style="background-color:#fafafa;margin:0"> 
  <table style="font-family:'proxima nova' , 'century gothic' , 'arial' , 'verdana' , sans-serif;font-size:14px;color:#5e5e5e;width:98%;max-width:600px;float:none;margin:0 auto" border="0" cellpadding="0" cellspacing="0" valign="top" align="left">
    <tbody>
      <tr align="middle">
        <td style="padding-top:30px;padding-bottom:32px"><img src="https://www.familybusinessinstitute.com/wp-content/uploads/2020/10/fbi-logo-okta.png" height="100" width="250" /></td>
      </tr>
      <tr bgcolor="#ffffff">
        <td> 
          <table bgcolor="#ffffff" style="width:100%;line-height:20px;padding:32px;border:1px solid;border-color:#f0f0f0" cellpadding="0">
            <tbody>
              <tr>
                <td style="color:#5e5e5e;font-size:22px;line-height:22px"> ${f:escapeHtml(user.firstName)}  ${f:escapeHtml(user.lastName)} - FBI Performance Roundtable Benchmarking Password Reset Requested </td>
              </tr>
              <tr>
                <td style="padding-top:24px;vertical-align:bottom"> Hi ${f:escapeHtml(user.firstName)}, </td>
              </tr>
              <tr>
                <td style="padding-top:24px"> A password reset request was made for your Performance Roundtable Benchmarking user account. </td>
              </tr>
              <tr>
                <td style="padding-top:24px"> Click this link to reset the password for your username, ${user.login}: </td>
              </tr>
              <tr>
                <td align="center"> 
                  <table border="0" cellpadding="0" cellspacing="0" valign="top">
                    <tbody>
                      <tr>
                          <td align="center" style="display:inline-block;padding:10px;border:1px solid;text-align:center;cursor:pointer;color:#fff;border-radius:3px;background-color:#e9872d;border-color:#e9872d #e9872d#e9872d;box-shadow:#e9872d 0 1px 0"> <a id="reset-password-link" href="${resetPasswordLink}" style="text-decoration:none"> <span style="font-size:13.5px;color:black"> Reset Password </span> </a> </td>
                      </tr>
<tr><td><br/></td></tr>
                      <tr>
                        <td align="center" style="color:#999"> This link expires in ${f:formatTimeDiffDateNowInUserLocale(resetPasswordTokenExpirationDate)}. </td>
                      </tr>
                    </tbody>
                  </table> </td>
              </tr>
              <tr>
                <td style="padding-top:24px"> Your organization's sign-in page is <a href="${baseURL}" style="color:#007dc1;text-decoration:none"><span style="color:#007dc1;text-decoration:none">${baseURL}</span></a> </td>
              </tr>
              <tr>
                <td style="padding-top:24px">If you experience difficulties accessing your Benchmarking account, you can click the link below for help: <a href="https://www.familybusinessinstitute.com/benchmarking-login-help/" style="color:#007dc1;text-decoration:none"><span style="color:#007dc1;text-decoration:none">https://www.familybusinessinstitute.com/benchmarking-login-help/</span></a>  </td>
              </tr>
            </tbody>
          </table> </td>
      </tr>
     
    </tbody>
  </table> 
</div>"
  }
    }
