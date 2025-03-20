variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

variable "website_folder" {
  type        = string
  description = "Local path to website files (HTML/CSS)"
}

variable "mime_types" {
  type = map(string)
  default = {
    ".html" = "text/html"
    ".css"  = "text/css"
    ".js"   = "application/javascript"
    ".png"  = "image/png"
    ".jpg"  = "image/jpeg"
  }
}
