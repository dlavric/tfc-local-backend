resource "null_resource" "mynull1" {
  provisioner "local-exec" {
    command = "uname -a ; env"
  }

  triggers = {
    always_run = timestamp()
  }
}
