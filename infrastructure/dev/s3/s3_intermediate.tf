# -----------------------------
# Trimmed FASTQ Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_trimmed_fastq" {
  bucket = "dev-mosaic-trimmed-fastq"
  
  tags = merge(
    local.common_tags,
    {
      type = "intermediate"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_trimmed_fastq_versioning" {
  bucket = aws_s3_bucket.dev_trimmed_fastq.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_trimmed_fastq_encryption" {
  bucket = aws_s3_bucket.dev_trimmed_fastq.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_trimmed_fastq_public_access_block" {
  bucket = aws_s3_bucket.dev_trimmed_fastq.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "dev_trimmed_fastq_logging" {
  bucket = aws_s3_bucket.dev_trimmed_fastq.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/trimmed_fastq/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_trimmed_fastq_lifecycle" {
  bucket = aws_s3_bucket.dev_trimmed_fastq.id

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

resource "aws_s3_bucket_notification" "dev_trimmed_fastq_notification" {
  bucket = aws_s3_bucket.dev_trimmed_fastq.id
  eventbridge = true
}

# -----------------------------
# BAM Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_bam" {
  bucket = "dev-mosaic-bam"
  
  tags = merge(
    local.common_tags,
    {
      type = "intermediate"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_bam_versioning" {
  bucket = aws_s3_bucket.dev_bam.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_bam_encryption" {
  bucket = aws_s3_bucket.dev_bam.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_bam_public_access_block" {
  bucket = aws_s3_bucket.dev_bam.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "dev_bam_logging" {
  bucket = aws_s3_bucket.dev_bam.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/bam/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_bam_lifecycle" {
  bucket = aws_s3_bucket.dev_bam.id

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

resource "aws_s3_bucket_notification" "dev_bam_notification" {
  bucket = aws_s3_bucket.dev_bam.id
  eventbridge = true
}

# -----------------------------
# VCF Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_vcf" {
  bucket = "dev-mosaic-vcf"
  
  tags = merge(
    local.common_tags,
    {
      type = "intermediate"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_vcf_versioning" {
  bucket = aws_s3_bucket.dev_vcf.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_vcf_encryption" {
  bucket = aws_s3_bucket.dev_vcf.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_vcf_public_access_block" {
  bucket = aws_s3_bucket.dev_vcf.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "dev_vcf_logging" {
  bucket = aws_s3_bucket.dev_vcf.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/vcf/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_vcf_lifecycle" {
  bucket = aws_s3_bucket.dev_vcf.id

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

resource "aws_s3_bucket_notification" "dev_vcf_notification" {
  bucket = aws_s3_bucket.dev_vcf.id
  eventbridge = true
}

# -----------------------------
# Filtered VCF Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_filtered_vcf" {
  bucket = "dev-mosaic-filtered-vcf"
  
  tags = merge(
    local.common_tags,
    {
      type = "intermediate"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_filtered_vcf_versioning" {
  bucket = aws_s3_bucket.dev_filtered_vcf.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_filtered_vcf_encryption" {
  bucket = aws_s3_bucket.dev_filtered_vcf.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_filtered_vcf_public_access_block" {
  bucket = aws_s3_bucket.dev_filtered_vcf.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "dev_filtered_vcf_logging" {
  bucket = aws_s3_bucket.dev_filtered_vcf.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/filtered_vcf/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_filtered_vcf_lifecycle" {
  bucket = aws_s3_bucket.dev_filtered_vcf.id

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

resource "aws_s3_bucket_notification" "dev_filtered_vcf_notification" {
  bucket = aws_s3_bucket.dev_filtered_vcf.id
  eventbridge = true
}

# -----------------------------
# Annotated VCF Bucket
# -----------------------------
resource "aws_s3_bucket" "dev_annotated_vcf" {
  bucket = "dev-mosaic-annotated-vcf"
  
  tags = merge(
    local.common_tags,
    {
      type = "intermediate"
    }
  )
}

resource "aws_s3_bucket_versioning" "dev_annotated_vcf_versioning" {
  bucket = aws_s3_bucket.dev_annotated_vcf.id
  
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "dev_annotated_vcf_encryption" {
  bucket = aws_s3_bucket.dev_annotated_vcf.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.s3_encryption.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "dev_annotated_vcf_public_access_block" {
  bucket = aws_s3_bucket.dev_annotated_vcf.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_logging" "dev_annotated_vcf_logging" {
  bucket = aws_s3_bucket.dev_annotated_vcf.id

  target_bucket = aws_s3_bucket.dev_logging.id
  target_prefix = "log/annotated_vcf/"
}

resource "aws_s3_bucket_lifecycle_configuration" "dev_annotated_vcf_lifecycle" {
  bucket = aws_s3_bucket.dev_annotated_vcf.id

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

resource "aws_s3_bucket_notification" "dev_annotated_vcf_notification" {
  bucket = aws_s3_bucket.dev_annotated_vcf.id
  eventbridge = true
}