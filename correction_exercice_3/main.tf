variable "environment_variable" {
  description = "the environment value"
  type = string
  validation {
    condition = var.environment_variable == "prod" || var.environment_variable == "dev"
    error_message = "The environement value must be prod or dev"
  }
}


variable "type_instance" {
  description = "the type of instance"
  type = string
   validation {
    # condition = var.environment_variable == "small" || var.environment_variable == "large"
    condition = length(regexall("^(small|large)$", var.type_instance)) > 0
    error_message = "The instance type must be small or large"
  }
}


# ne fonctionne pas car default ne peut pas être dynamique

# variable "size_instance" {
#   description = "size instance"
#   default = var.type_instance == "small" ? "micro" : "big"
# }

locals {
  size_instance = var.type_instance == "small" ? "micro" : "big"
}


output "result_instance_size" {
  value = local.size_instance
}
