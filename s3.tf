resource "aws_s3_bucket" "prod1-bucket" {
    bucket = "aws-prod-app1-bucket"

    tags = {
        Environment = "prod"
    }  
  
}
resource "aws_s3_bucket_versioning" "versioning" {
    bucket = aws_s3_bucket.prod1-bucket.id
    versioning_configuration {
        status = "Enabled"
    } 
}