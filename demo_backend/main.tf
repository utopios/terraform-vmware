# terraform {
#   backend "local" {
#     path = "path/to/state/file"
#   }
# }

terraform {
  backend "http" {
    address = "https://api.backend.com/?token=token_access"
  }
}

terraform {
  backend "consul" {
    address = "value"
    
  }
}