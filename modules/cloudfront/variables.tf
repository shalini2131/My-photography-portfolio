variable "bucket_name" {
  type        = string
  description = "S3 bucket name used as origin"
}

variable "s3_website_url" {
  type        = string
  description = "S3 static website endpoint URL"
}
