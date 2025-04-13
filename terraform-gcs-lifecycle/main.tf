resource "google_storage_bucket" "default" {
  name          = var.bucket_name
  location      = var.location
  storage_class = var.storage_class
  force_destroy = var.force_destroy

  uniform_bucket_level_access = true

  lifecycle {
    prevent_destroy = false
  }
  dynamic "lifecycle_rule" {
  for_each = var.enable_lifecycle ? var.lifecycle_rules : []
  content {
    action {
      type          = lifecycle_rule.value.action_type
      storage_class = lookup(lifecycle_rule.value, "action_storage_class", null)
    }

    condition {
      age                   = lookup(lifecycle_rule.value, "condition_age", null)
      created_before        = lookup(lifecycle_rule.value, "created_before", null)
      matches_storage_class = lookup(lifecycle_rule.value, "matches_storage_class", null)
      matches_prefix        = lookup(lifecycle_rule.value, "condition_prefixes", null)
      matches_suffix        = lookup(lifecycle_rule.value, "condition_suffixes", null)
    }
  }
 }
}