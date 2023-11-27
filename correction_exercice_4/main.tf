
variable "names" {
  description = "list of names"
  type = list(string)
  default = [ "toto", "tata", "titi" ]
}




locals {
  chaine = join(",", var.names)
}

output "result_join" {
  value = local.chaine
}

output "size_list" {
  value = length(var.names)
}

output "from_template" {
  value = [for s in var.names : templatefile("${path.module}/example.tpl", {name = s})]
}

