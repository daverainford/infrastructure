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
      expiration_days = 30
    }
  }

  #-------------------------------------------------
  # Lifecycle Rules
  #-------------------------------------------------
  short_term_lifecycle_rule = {
    id     = "short-term-data-lifecycle"
    status = "Enabled"
    
    transition = {
      days          = 0
      storage_class = "STANDARD"
    }
    
    expiration = {
      days = local.lifecycle_configs.short_term.expiration_days
    }
  }
}