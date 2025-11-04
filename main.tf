terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "~> 3.4"
    }
  }
}

resource "random_integer" "email_num" {
  min = 1000
  max = 9999
} 

resource "random_pet" "first_name" {
  length = 1
}

resource "random_pet" "last_name" {
  length = 1
}

provider "http" {}

locals {

  # License start and end dates
  start= formatdate("YYYY-MM-DD'T'HH:mm:ss'Z'", timestamp())
  end  =  formatdate("YYYY-MM-DD'T'HH:mm:ss'Z'", timeadd(local.start,"${var.license_days * 24}h"))

  # JSON payload (as a string)
   payload = jsonencode({
      first_name        = "${random_pet.first_name.id}"
      last_name         = "${random_pet.last_name.id}"
      email             = "instruqt+${random_integer.email_num.result}@illumio.com"
      company_name      = "Illumio account ${random_integer.email_num.result}"
    domain            = "console.illum.io"
    preferred_region  = "${var.preferred_region}"
    country_code      = "${var.country_code}"
    pce_fqdn          = "${var.pce_cluster_name}"
    store_rbac        = true
    optional_features = ["magiclinks_enabled"]
    settings = {
      auth = {
        passkeys = {
          enabled = true
        }
        passwords = {
          enabled = true
        }
      }
    }
    licenses = {
      insights = {
        type               = "${var.insights_type}"
        start              = "${local.start}"
        end                = "${local.end}"
        name               = "Illumio Insights Free Trial"
        planName           = "Insights Trial Plan"
        workloadsLicensed  = "${var.insights_workloads}"
      },
      segmentation = {
        type               = "${var.segmentation_type}"
        start              = "${local.start}"
        end                = "${local.end}"
        name               = "Illumio Segmentation"
        planName           = "Segmentation Paid Plan"
        workloadsLicensed  = "${var.segmentation_workloads}"
      }
    }
    generateApiKey    = true
    # tenant_expiration = "${var.expiration_days}"
  })
}

# Send POST request
data "http" "post_request" {
  url    = "${var.base_url}"
  method = "POST"

  request_headers = {
    "Content-Type"  = "application/json"
    "Authorization" = "${var.api_token}"
  }

  request_body = local.payload
}


# --- Parse JSON response ---
locals {
  response = jsondecode(data.http.post_request.response_body)
}
