resource "aws_s3_bucket" "site" {
  bucket = "youtube-live-48"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.site.bucket #""youtube-live-48""
  key    = "index.html"
  source = "index.html"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.site.bucket

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.site.id
  acl    = "public-read"
}

resource "aws_s3_bucket_policy" "allow_access" {
  bucket = aws_s3_bucket.site.bucket
  policy = file("policy.json")
}