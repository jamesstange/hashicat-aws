
  
locals {
  bucket_name = "s3-bucket-${random_id.app-server-id.dec}"
}

module "s3-bucket" {
  source  = "app.terraform.io/jstange-training/s3-bucket/aws"
  version = "2.0.0"
 
  bucket        = local.bucket_name
  acl           = "private"
  force_destroy = true

  #attach_policy = true
  #policy        = data.aws_iam_policy_document.bucket_policy.json

  attach_deny_insecure_transport_policy = true

  tags = {
    Owner = "Anton"
  }

  versioning = {
    enabled = true
  }

}