variable "project_id" {
  description = "The GCP project ID"
  type        = string
}

variable "region" {
  description = "The GCP region"
  type        = string
  default     = "us-central1"
}

variable "bucket_name" {
  description = "The name of the GCS bucket"
  type        = string
}

variable "location" {
  description = "The location of the GCS bucket"
  type        = string
  default     = "US"
}

variable "storage_class" {
  description = "The storage class of the GCS bucket"
  type        = string
  default     = "STANDARD"
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket"
  type        = bool
  default     = false
}

# Existing variables...

variable "enable_lifecycle" {
  description = "Enable lifecycle rules for the bucket"
  type        = bool
  default     = false
}

variable "lifecycle_rules" {
  description = "Lifecycle rules for GCS bucket"
  type = list(object({
    action_type            = string
    action_storage_class   = optional(string)
    condition_age          = optional(number)
    created_before         = optional(string)
    matches_storage_class  = optional(list(string))
    condition_prefixes     = optional(list(string))
    condition_suffixes     = optional(list(string))
  }))
  default = []
}
