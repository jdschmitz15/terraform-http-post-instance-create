# output "debug_raw_response" {
#  value = local.response
# }

output "message" {
 value = local.response.message
}
# --- Output values ---
output "user_email" {
  value = local.response.users[0].email
}

output "apikey_id" {
  value     = local.response.users[0].apikey.keyId
}

output "apikey_secret" {
  value     = local.response.users[0].apikey.secret
}

output "apikey_success" {
  value     = local.response.users[0].apikey.success
}

output "magiclink" {
  value     = local.response.users[0].magiclink
}

output "tenant_id" {
  value = local.response.tenant.id
}

output "org_id" {
  value = local.response.tenant.core.id
}

output "pce_fqdn" {
  value = local.response.tenant.core.pceFqdn
}

output "saApiKey_keyId" {
  value = local.response.tenant.saApiKey.keyId
}

output "saApiKey_secret" {
  value = local.response.tenant.saApiKey.secret
}

output "saApiKey_success" {
  value = local.response.tenant.saApiKey.success
}

