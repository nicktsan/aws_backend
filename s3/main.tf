//s3 bucket
resource "aws_s3_bucket" "s3_backend" {
  bucket = var.bucket_name
  //prevents s3 bucket from being destroyed. Set this to false if it needs to be destroyed.
  lifecycle {
    prevent_destroy = true
  }
  tags = local.tags
}
//applies an s3 bucket acl resource to s3_backend
resource "aws_s3_bucket_acl" "s3_acl" {
  bucket = aws_s3_bucket.s3_backend.id
  acl    = "private"
}
//applies versioning to s3_backend
resource "aws_s3_bucket_versioning" "s3_versioning" {
  bucket = aws_s3_bucket.s3_backend.id
  versioning_configuration {
    status = "Enabled"
  }
}
//applies server-side encryption to s3_backend for security purposes
resource "aws_s3_bucket_server_side_encryption_configuration" "s3_encryption" {
  bucket = aws_s3_bucket.s3_backend.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}

//dynamodb
resource "aws_dynamodb_table" "db_backend" {
  name           = var.dynamodb_name
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = local.tags
}
