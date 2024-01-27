terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
    access_key = var.ACCESS_KEY
    secret_key = var.SECRET_key
    region = var.REGION
}

resource "aws_s3_bucket" "dev" {
  bucket = var.bucketname

  tags = {
    Name= "bucketname" #Include tag to your bucket
  }
}
#Create a User group
resource "aws_iam_group" "developers" {
  name = "developers-group"
}

#Create IAM users
resource "aws_iam_user" "dev-user" {
  count = length(var.username)
  name = var.username[count.index]
}

#Add group membership
resource "aws_iam_group_membership" "developer-members" {
  count = length(var.username)
  name  = aws_iam_group.developers.name
  users = [aws_iam_user.dev-user[count.index].name]
  group = aws_iam_group.developers.name
}

#Define bucket policy to allow full access
resource "aws_iam_policy" "s3_full_access" {
  name        = "s3-full-access-policy"
  description = "Grants full access to S3 bucket"
  policy = jsonencode({
    Version   = "2012-10-17"
    Statement = [{
      Effect    = "Allow"
      Action    = "s3:*"
      Resource  = "arn:aws:s3:::${aws_s3_bucket.dev.bucket}/*"
    }]
  })
}

#Attach policy to the user group
resource "aws_iam_group_policy_attachment" "policy-attach" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.s3_full_access.arn
}