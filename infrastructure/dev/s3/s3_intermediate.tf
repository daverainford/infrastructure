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