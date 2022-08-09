resource "null_resource" "mynull1" {
  provisioner "local-exec" {
    command = "env"
  }

  triggers = {
    always_run = timestamp()
  }
}
