# tfc-local-backend
This repository is created only for learning purposes on how to use a local backend.
The file `main.tf` creates the `null_resource` using the provisioner `local-exec`.

### Prerequisites

- [X] [Terraform](https://www.terraform.io/downloads)

## How to Use this Repo

- Clone this repository:
```shell
git clone git@github.com:dlavric/tfc-local-backend.git
```

- Go to the directory where the repo is stored:
```shell
cd tfc-local-backend
```

- Run `terraform init`, to download any external dependencies
```shell
terraform init
```

This is the output of initializing the Terraform code:
```shell
Initializing the backend...

Initializing provider plugins...
- Finding latest version of hashicorp/null...
- Installing hashicorp/null v3.1.1...
- Installed hashicorp/null v3.1.1 (signed by HashiCorp)

Terraform has created a lock file .terraform.lock.hcl to record the provider
selections it made above. Include this file in your version control repository
so that Terraform can guarantee to make the same selections by default when
you run "terraform init" in the future.

Terraform has been successfully initialized!

You may now begin working with Terraform. Try running "terraform plan" to see
any changes that are required for your infrastructure. All Terraform commands
should now work.

If you ever set or change modules or backend configuration for Terraform,
rerun this command to reinitialize your working directory. If you forget, other
commands will detect it and remind you to do so if necessary.
```

- Apply the changes with Terraform
```shell
terraform apply
```

This is the output for applying the changes:
```shell
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.helloWorld will be created
  + resource "null_resource" "helloWorld" {
      + id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.

Do you want to perform these actions?
  Terraform will perform the actions described above.
  Only 'yes' will be accepted to approve.

  Enter a value: yes

null_resource.helloWorld: Creating...
null_resource.helloWorld: Provisioning with 'local-exec'...
null_resource.helloWorld (local-exec): Executing: ["/bin/sh" "-c" "echo hello world"]
null_resource.helloWorld (local-exec): hello world
null_resource.helloWorld: Creation complete after 0s [id=8075251998656090574]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.
```

- Destroy the resources 
```shell
terraform destroy

null_resource.helloWorld: Refreshing state... [id=8075251998656090574]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # null_resource.helloWorld will be destroyed
  - resource "null_resource" "helloWorld" {
      - id = "8075251998656090574" -> null
    }

Plan: 0 to add, 0 to change, 1 to destroy.

Do you really want to destroy all resources?
  Terraform will destroy all your managed infrastructure, as shown above.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes

null_resource.helloWorld: Destroying... [id=8075251998656090574]
null_resource.helloWorld: Destruction complete after 0s

Destroy complete! Resources: 1 destroyed.
```

## Reference Documentation

- [Terraform null_resource](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource)

- [Terraform local_exec Provisioner](https://www.terraform.io/language/resources/provisioners/local-exec)