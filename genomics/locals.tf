# locals.tf
locals {
  common_tags = {
    env     = "dev"
    project = "mosaic"
  }
  
  lifecycle_configs = {
    short_term = {
      expiration_days = 14
    }
  }
}