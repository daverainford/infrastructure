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
  bucket = aws_s3_bucket.dev_user_input_fastq.id
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
  bucket = aws_s3_bucket.dev_user_input_bam.id
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
  bucket = aws_s3_bucket.dev_user_input_vcf.id
  eventbridge = true
}