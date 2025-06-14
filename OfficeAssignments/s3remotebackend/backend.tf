terraform {
    backend "s3" {
        bucket  = "assignmet1-remote-backend"
        key     = "dev/terraform.tfstate"   # folder + file in the bucket
        region  = "ap-south-1"
        profile = "priyesh"
    }
}
