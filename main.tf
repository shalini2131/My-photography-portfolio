provider "aws" {
  region = var.aws_region
}

module "s3_static_site" {
  source         = "./modules/s3"
  bucket_name    = var.bucket_name
  website_folder = "${path.module}/website"
}

module "cloudfront_cdn" {
  source         = "./modules/cloudfront"
  bucket_name    = module.s3_static_site.bucket_name
  s3_website_url = module.s3_static_site.website_url
}

