variable "trigger_var" {
  description = "trigger to update resource 1"
}

resource "null_resource" "resource0" {
  
}

resource "null_resource" "resource1" {
    attribute1 = var.val_attribute1
    attribute2 = var.trigger_var
    lifecycle {
        create_before_destroy = true
        prevent_destroy = true
        ignore_changes = [ attribute1 ]
        replace_triggered_by = [ attribute2 ]
        
    }
}

resource "null_resource" "resource2" {
  depends_on = [ null_resource.resource1, null_resource.resource0 ]
}