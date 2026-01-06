terraform {
  backend "s3" {
    bucket         = "my-terraform-state-prod"
    key            = "eks/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    use_lockfile   = false
    encrypt        = true
  }
}
