provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "backend_testing" {
  bucket        = "my-magical-test-backend-bucket-from-bug"
  force_destroy = true


  tags = merge(
    local.global_tags, {
      Name = "Backend-bucket"
    }
  )
}

resource "aws_s3_bucket_versioning" "backend_testing_versioning" {
  bucket = aws_s3_bucket.backend_testing.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend_testing_sse" {
  bucket = aws_s3_bucket.backend_testing.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
