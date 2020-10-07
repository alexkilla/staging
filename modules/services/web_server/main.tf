data "template_file" "user_data" {
  template = file("${path.module}/user_data.sh")
  vars = {
    server_port = var.server_port
    db_address = var.db_address
    db_port  = var.db_port
  }
}