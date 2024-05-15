resource "random_string" "hex_string" {
  length  = 10
  special = false
  upper   = false
  lower   = true
  numeric  = true
}