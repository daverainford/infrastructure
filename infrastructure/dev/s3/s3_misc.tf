# -----------------------------
# Archive Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_archive" {
  bucket = "dev-mosaic-archive"
  
  tags = merge(
    local.common_tags,
    {
      type = "archive"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_archive_versioning" {
  bucket = aws_s3_bucket.dev_archive.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_archive_encryption" {
  bucket = aws_s3_bucket.dev_archive.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_archive_public_access_block" {
  bucket = aws_s3_bucket.dev_archive.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "dev_archive_logging" {
  bucket = aws_s3_bucket.dev_archive.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/archive/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_archive_lifecycle" {
  bucket = aws_s3_bucket.dev_archive.id

  rule {
    id     = local.deep_archive_lifecycle_rule.id
    status = local.deep_archive_lifecycle_rule.status
    
    transition {
      days          = local.deep_archive_lifecycle_rule.transition.days
      storage_class = local.deep_archive_lifecycle_rule.transition.storage_class
    }
  }
}

resource "aws_s3_bucket_notification" "dev_archive_notification" {
  bucket = aws_s3_bucket.dev_archive.id
  eventbridge = true
}

# -----------------------------
# Logging Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_logging" {
  bucket = "dev-mosaic-logging"
  
  tags = merge(
    local.common_tags,
    {
      type = "logging"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_logging_versioning" {
  bucket = aws_s3_bucket.dev_logging.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_logging_encryption" {
  bucket = aws_s3_bucket.dev_logging.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_logging_public_access_block" {
  bucket = aws_s3_bucket.dev_logging.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# Logging bucket logs to itself with a different prefix to avoid infinite loops
resource "aws_s3_bucket_logging" "dev_logging_logging" {
  bucket = aws_s3_bucket.dev_logging.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/self-logs/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_logging_lifecycle" {
  bucket = aws_s3_bucket.dev_logging.id

  rule {
    id     = local.short_term_lifecycle_rule.id
    status = local.short_term_lifecycle_rule.status

    transition {
      days          = local.short_term_lifecycle_rule.transition.days
      storage_class = local.short_term_lifecycle_rule.transition.storage_class
    }
  }
}

# -----------------------------
# Omics Fallback Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_omics_fallback" {
  bucket = "dev-mosaic-omics-fallback"
  
  tags = merge(
    local.common_tags,
    {
      type = "fallback"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_omics_fallback_versioning" {
  bucket = aws_s3_bucket.dev_omics_fallback.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_omics_fallback_encryption" {
  bucket = aws_s3_bucket.dev_omics_fallback.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_omics_fallback_public_access_block" {
  bucket = aws_s3_bucket.dev_omics_fallback.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "dev_omics_fallback_logging" {
  bucket = aws_s3_bucket.dev_omics_fallback.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/omics_fallback/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_omics_fallback_lifecycle" {
  bucket = aws_s3_bucket.dev_omics_fallback.id

  rule {
    id     = local.short_term_lifecycle_rule.id
    status = local.short_term_lifecycle_rule.status

    transition {
      days          = local.short_term_lifecycle_rule.transition.days
      storage_class = local.short_term_lifecycle_rule.transition.storage_class
    }

    expiration {
      days = local.short_term_lifecycle_rule.expiration.days
    }
  }
}

resource "aws_s3_bucket_notification" "dev_omics_fallback_notification" {
  bucket = aws_s3_bucket.dev_omics_fallback.id
  eventbridge = true
}

# -----------------------------
# Reference Genomes Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_reference_genomes" {
  bucket = "dev-mosaic-reference-genomes"
  
  tags = merge(
    local.common_tags,
    {
      type = "reference-data"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_reference_genomes_versioning" {
  bucket = aws_s3_bucket.dev_reference_genomes.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_reference_genomes_encryption" {
  bucket = aws_s3_bucket.dev_reference_genomes.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_reference_genomes_public_access_block" {
  bucket = aws_s3_bucket.dev_reference_genomes.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "dev_reference_genomes_logging" {
  bucket = aws_s3_bucket.dev_reference_genomes.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/reference_genomes/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_reference_genomes_lifecycle" {
  bucket = aws_s3_bucket.dev_reference_genomes.id

  rule {
    id     = local.short_term_lifecycle_rule.id
    status = local.short_term_lifecycle_rule.status

    transition {
      days          = local.short_term_lifecycle_rule.transition.days
      storage_class = local.short_term_lifecycle_rule.transition.storage_class
    }
  }
}

resource "aws_s3_bucket_notification" "dev_reference_genomes_notification" {
  bucket = aws_s3_bucket.dev_reference_genomes.id
  eventbridge = true
}