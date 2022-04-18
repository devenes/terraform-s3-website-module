resource "aws_s3_bucket" "static_site" {
  bucket = var.bucket_name
  acl    = "public-read"

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_object" "index" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "index.html"
  source       = "html/index.html"
  content_type = "text/html"
  etag         = md5(file("html/index.html"))
  acl          = "public-read"
}

resource "aws_s3_bucket_object" "error" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "error.html"
  source       = "html/error.html"
  content_type = "text/html"
  etag         = md5(file("html/error.html"))
  acl          = "public-read"
}

resource "aws_s3_bucket_object" "js" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "js/script.js"
  source       = "js/script.js"
  content_type = "application/javascript"
  etag         = md5(file("js/script.js"))
  acl          = "public-read"
}


resource "aws_s3_bucket_object" "css" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "css/style.css"
  source       = "css/style.css"
  content_type = "text/css"
  etag         = md5(file("css/style.css"))
  acl          = "public-read"
}

resource "aws_s3_bucket_object" "img" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "icon/bellagio.jpg"
  source       = "icon/bellagio.jpg"
  content_type = "image/jpeg"
  acl          = "public-read"
}

resource "aws_s3_bucket_object" "img2" {
  bucket       = aws_s3_bucket.static_site.bucket
  key          = "icon/ansible.jpg"
  source       = "icon/ansible.jpg"
  content_type = "image/jpeg"
  acl          = "public-read"
}
