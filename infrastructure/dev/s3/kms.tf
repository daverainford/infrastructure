# KMS Key for S3 bucket encryption
resource "aws_kms_key" "s3_encryption" {
  description             = "KMS key for S3 bucket encryption"
  deletion_window_in_days = local.kms_key_settings.deletion_window_in_days
  enable_key_rotation     = local.kms_key_settings.enable_key_rotation
  key_usage               = local.kms_key_settings.key_usage

  tags = merge(
    local.common_tags,
    {
      type = "encryption"
    }
  )
}

resource "aws_kms_alias" "s3_encryption" {
  name          = "alias/s3-encryption-key"
  target_key_id = aws_kms_key.s3_encryption.key_id
}