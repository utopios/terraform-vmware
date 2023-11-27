variable "demo_condition" {
    description = "value of the condition"
    type = bool
    default = true
}



variable "list_of_strings" {
  description = "A list of strings"
  type        = list(string)
  default     = ["apple", "banana", "cherry"]
}
output "lengths_of_strings" {
  value = [for s in var.list_of_strings : length(s)]
}

output "out_condition" {
  value = var.demo_condition ? "The condition is true": "The condition is false"
}