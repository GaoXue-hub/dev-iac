provider "tfe" {}

terraform {
  required_version = ">= 0.14"

  required_providers {
    aws = {
      source  = "hashicorp/tfe"
      version = ">=0.22.0"
    }
  }
}

resource "tfe_organization" "test" {
  name                     = "test20201120"
  email                    = "mizumoto.shigeyuki@isid.co.jp"
  session_timeout_minutes  = 60 * 6
  session_remember_minutes = 60 * 24
  collaborator_auth_policy = "two_factor_mandatory"
}

resource "tfe_workspace" "base" {
  name         = "base"
  organization = tfe_organization.test.name
}
resource "tfe_workspace" "app" {
  name         = "app"
  organization = tfe_organization.test.name
}
