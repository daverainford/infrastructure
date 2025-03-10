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