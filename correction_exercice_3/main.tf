variable "environment_variable" {
  description = "the environment value"
  type = string
  default = "dev"
  validation {
    condition = var.environment_variable == "prod" || var.environment_variable == "dev"
    error_message = "The environement value must be prod or dev"
  }
}

variable "all_cases" {
  description = "mapping all cases"
  type = map(string)
  default = {
    "small" = "micro"
    "large" = "big"
  }
}

variable "names" {
  description = "list of names"
  type = list(string)
  default = [ "toto", "tata", "titi" ]
}


variable "type_instance" {
  description = "the type of instance"
  type = string
  default = "small"
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
  # size_instance = var.type_instance == "small" ? "micro" : "big"
  size_instance = var.all_cases[var.type_instance]
  messages = [for s in var.names: "welecome ${s}"]
}


output "result_instance_size" {
  value = local.size_instance
}

output "welecome_message" {
  value = local.messages
}

# Ce n'est pas possible d'utiliser le for_each avec output 


# output "welecome_message_foreach" {
#   for_each = var.names
#   value = each.value
# }
