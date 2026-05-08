#this is resource to create a s3 bucket in aws


resource "aws_s3_bucket" "my_bucket" {
  bucket = "telegram-backup-bucket-vizag"
}
