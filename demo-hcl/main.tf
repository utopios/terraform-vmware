# Le premier block => provider à utiliser
# provider {

# }

# Le deuxième block => gestion de ressources
# les variables
# resource "type" "name" {
#   ## Configuration de la ressource
# }


# la troisième block => gestion des sorites

# output "name" {
#   value = "sortie"
# }


//Déclaration des variables
variable "var_1" {
  description = "first var"
  type = string
  default = "default value"
}


output "output_var_1" {
  value = var.var_1
}

output "output_var_2" {
  value = var.var_2
}

output "output_var_3" {
  value = var.var_3
}