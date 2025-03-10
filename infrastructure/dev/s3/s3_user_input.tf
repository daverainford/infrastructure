# -----------------------------
# FASTQ Input Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_user_input_fastq" {
  bucket = "dev-mosaic-user-input-fastq"

  tags = merge(
    local.common_tags,
    {
      type = "user_input"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_user_input_fastq_versioning" {
  bucket = aws_s3_bucket.dev_user_input_fastq.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_user_input_fastq_encryption" {
  bucket = aws_s3_bucket.dev_user_input_fastq.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_user_input_fastq_public_access_block" {
  bucket = aws_s3_bucket.dev_user_input_fastq.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "dev_user_input_fastq_logging" {
  bucket = aws_s3_bucket.dev_user_input_fastq.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/user_input_fastq/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_user_input_fastq_lifecycle" {
  bucket = aws_s3_bucket.dev_user_input_fastq.id

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

resource "aws_s3_bucket_notification" "dev_user_input_fastq_notification" {
  bucket      = aws_s3_bucket.dev_user_input_fastq.id
  eventbridge = true
}

# -----------------------------
# BAM Input Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_user_input_bam" {
  bucket = "dev-mosaic-user-input-bam"

  tags = merge(
    local.common_tags,
    {
      type = "user_input"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_user_input_bam_versioning" {
  bucket = aws_s3_bucket.dev_user_input_bam.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_user_input_bam_encryption" {
  bucket = aws_s3_bucket.dev_user_input_bam.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_user_input_bam_public_access_block" {
  bucket = aws_s3_bucket.dev_user_input_bam.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "dev_user_input_bam_logging" {
  bucket = aws_s3_bucket.dev_user_input_bam.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/user_input_bam/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_user_input_bam_lifecycle" {
  bucket = aws_s3_bucket.dev_user_input_bam.id

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

resource "aws_s3_bucket_notification" "dev_user_input_bam_notification" {
  bucket      = aws_s3_bucket.dev_user_input_bam.id
  eventbridge = true
}

# -----------------------------
# VCF Input Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_user_input_vcf" {
  bucket = "dev-mosaic-user-input-vcf"

  tags = merge(
    local.common_tags,
    {
      type = "user_input"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_user_input_vcf_versioning" {
  bucket = aws_s3_bucket.dev_user_input_vcf.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_user_input_vcf_encryption" {
  bucket = aws_s3_bucket.dev_user_input_vcf.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_user_input_vcf_public_access_block" {
  bucket = aws_s3_bucket.dev_user_input_vcf.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "dev_user_input_vcf_logging" {
  bucket = aws_s3_bucket.dev_user_input_vcf.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/user_input_vcf/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_user_input_vcf_lifecycle" {
  bucket = aws_s3_bucket.dev_user_input_vcf.id

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

resource "aws_s3_bucket_notification" "dev_user_input_vcf_notification" {
  bucket      = aws_s3_bucket.dev_user_input_vcf.id
  eventbridge = true
}