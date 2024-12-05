resource "prismacloud_policy" "example" {
  name        = "sample custom build policy created with terraform"
  policy_type = "config"
  cloud_type  = "aws"
  severity    = "High"
  labels      = ["AWS", "CIS", "Terraform"]
  description = "this describes the policy"
  rule {
    name = "sample custom build policy created with terraform"
    rule_type = "Config"
    parameters = {
      savedSearch = false
      withIac     = true
    }
    children {
      type           = "build"
      recommendation = "fix it"
      metadata = {
        "code" : file("policies/build/build_policy.yaml"),
      }
    }
  }
} 