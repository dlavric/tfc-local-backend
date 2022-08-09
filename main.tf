resource "null_resource" "helloWorld" {
    provisioner "local-exec" {
        command = "env echo hello world"
    }
}
