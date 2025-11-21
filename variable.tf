# Define the variable for the token
variable "api_token" {
  description = "Bearer token used for Authorization header"
  type        = string
  sensitive   = true
}

variable "base_url" {
  description = "url used for API call"
  type        = string
  sensitive   = true
}

variable "preferred_region" {
  description = "Preferred region for the tenant"
  type        = string
  default     = "amer"
}
variable "country_code" {
  description = "Country code for the tenant"
  type        = string
  default     = "US"
}
variable "pce_cluster_name" { 
  description = "FQDN of the PCE cluster"
  type        = string
  sensitive   = true
}

variable "insights_type"  {
  description = "Type of Insights license"
  type        = string
  default     = "FREE_TRIAL"  
}
variable "insights_workloads" {
  description = "Number of workloads for Insights license"
  type        = number
  default     = 0
}
variable "segmentation_type" {
  description = "Type of Segmentation license"
  type        = string
  default     = "FREE_TRIAL"
}

variable "segmentation_workloads" {
  description = "Number of workloads for Segmentation license"
  type        = number
  default     = 0
}

variable "license_days" {
  description = "Number of days for license duration"
  type        = number
  default     = 7 
}

variable "expiration_days" {
  description = "Number of days for license duration"
  type        = number
  default     = 1 
}
