terraform {
  backend "s3" {
    bucket       = "730335223151-tf-state-eu-west-3"
    key          = "terraform.tfstate"
    region       = "eu-west-3"
    use_lockfile = true
    encrypt      = true
  }
}