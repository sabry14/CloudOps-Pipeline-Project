terraform {
  backend "s3" {
    bucket = "cloudops-terraform-state-036071343732"
    key    = "cloudops/terraform.tfstate"
    region = "us-east-1"
  }
}
