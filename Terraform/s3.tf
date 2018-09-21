resource "aws_s3_bucket" "web_bucket" {
    bucket = "srechallenge-web-server-bucket"
    acl = "private"
    versioning {
        enabled = true
    }
    tags {
        Name = "srechallenge-web-server-bucket"
    }
}