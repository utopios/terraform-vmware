variable "example_attribute1" {
  description = "An example attribute 1"
  type        = string
  default     = "default_value1"
}

variable "example_attribute2" {
  description = "An example attribute 2"
  type        = string
  default     = "default_value2"
}

variable "all_expect_example_attribute" {
  description = "list of example attribute to ignore"
  type        = list(string)
  default     = [var.example_attribute2]
}

resource "null_resource" "example1" {
  example_attribute = var.example_attribute1
  lifecycle {
    create_before_destroy = true
    ignore_changes = [ example_attribute ]
  }
}

resource "null_resource" "example2" {
    example_attribute = var.example_attribute2
    lifecycle {
      prevent_destroy = true
    }
    depends_on = [ null_resource.example1 ]
}


resource "null_resource" "example3" {
  depends_on = [ null_resource.example2, null_resource.example1 ]
}
resource "null_resource" "example4" {
    lifecycle {
      ignore_changes = var.all_expect_example_attribute
    }
    depends_on = [ null_resource.example3 ]
}