# Variables
variable "AWS_ACCESS_KEY_ID" {
    description = "Access-key-for-AWS"
    default ="no_access_key_value_found" 
}

variable "AWS_SECRET_ACCESS_KEY" {
    description = "Secret-key-for-AWS"
    default ="no_access_key_value_found"
  
}

terraform {
    required_providers{
        aws = {
            source = "hashicorp/aws"
            version = "4.66.1"
        }
    }
}

provider "aws" {
     region = local.aws.region
     access_key = var.AWS_ACCESS_KEY_ID
     secret_key = var.AWS_SECRET_ACCESS_KEY
}