# terraform {
#   backend "local" {
#     path = "path/to/state/file"
#   }
# }

terraform {
  backend "http" {
    address = terraform.workspace == "prod" ? "https://api.prod.backend.com/?token=token_access" : "https://api.autre.backend.com/?token=token_access" 
  }
}

terraform {
  backend "consul" {
    address = "value"
    
  }
}