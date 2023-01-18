resource "aws_s3_bucket" "terrform_state"{
    bucket = "terform-up-and-running-state"
    lifecycle {
        prevent_destroy = true

    }

}
resource "aws_s3_bucket_versioning" "enabled"{
    bucket = aws_s3_bucket.terrform_state.id
    versioning_configuration {
        status = "Enabled"
    }
}
resource "aws_dynamodb_table" "terrform_lock"{
    name = "terraform-up-and-running-locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     ="LockID"

    attribute {
        name = "LockID"
        type = "S"
    }  
}

