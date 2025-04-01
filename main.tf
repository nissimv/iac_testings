provider "aws" {
  access_key = "AKIAFAKEACCESSKEY"  # Hardcoded secret
  secret_key = "fakeSecretKey12345" # Hardcoded secret
  region     = "us-east-1"
}

resource "aws_iam_policy" "bad_policy" {
  name        = "bad-policy"
  description = "Overly permissive policy"
  policy      = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "*"
        Resource = "*"
      }
    ]
  })
}

resource "aws_s3_bucket" "public_bucket" {
  bucket = "insecure-bucket"
  acl    = "public-read"  # Publicly accessible
}
