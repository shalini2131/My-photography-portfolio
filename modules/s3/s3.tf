resource "aws_s3_bucket" "static_site" {
  bucket = var.bucket_name
  force_destroy = true

  tags = {
    Name = "PhotographySite"
  }
}

resource "aws_s3_bucket_policy" "allow_public_read" {
  bucket = aws_s3_bucket.static_site.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Sid       = "PublicReadGetObject",
      Effect    = "Allow",
      Principal = "*",
      Action    = "s3:GetObject",
      Resource  = "${aws_s3_bucket.static_site.arn}/*"
    }]
  })
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_site.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_object" "website_files" {
  for_each = fileset(var.website_folder, "**/*")

  bucket       = aws_s3_bucket.static_site.id
  key          = each.value
  source       = "${var.website_folder}/${each.value}"

  content_type = lookup(var.mime_types, substr(each.value, length(each.value) - 4, 5), "text/html")

}

