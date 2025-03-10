locals {
  #-------------------------------------------------
  # Common Tags - Applied to all resources
  #-------------------------------------------------
  common_tags = {
    environment = "dev"
    project     = "mosaic"
  }

  #-------------------------------------------------
  # Lifecycle Configuration Parameters
  #-------------------------------------------------
  lifecycle_configs = {
    short_term = {
      expiration_days = 14
    }
  }

  #-------------------------------------------------
  # KMS Key Configuration
  #-------------------------------------------------
  kms_key_settings = {
    deletion_window_in_days = 10
    enable_key_rotation     = true
    key_usage               = "ENCRYPT_DECRYPT"
  }

  #-------------------------------------------------
  # Lifecycle Rules
  #-------------------------------------------------
  short_term_lifecycle_rule = {
    id     = "short-term-data-lifecycle"
    status = "Enabled"

    expiration = {
      days = local.lifecycle_configs.short_term.expiration_days
    }
  }

  # Deep archive rule
  deep_archive_lifecycle_rule = {
    id     = "deep-archive-data-lifecycle"
    status = "Enabled"

    transition = {
      days          = 0
      storage_class = "DEEP_ARCHIVE"
    }
  }
}