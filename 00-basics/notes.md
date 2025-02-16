# Primeros Pasos
1. Descargar [Terraform](https://developer.hashicorp.com/terraform/install?product_intent=terraform)
  - En mi caso al estar en linux segun la pagina de descargas debo utilizar lo siguiente:
    ```BASH
    wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform
    ```
  - El comando para usar terraform es `terraform` pero podemos crear un alias para que sea mas facil de usar: `alias tf=terraform`

2. Debemos crear un usuario en AWS para poder que terraform se comunique con la cuenta.
  - Entramos ala consola de AWS 
  - Buscamos el IAM service y creamos un nuevo usuario con el rol de `AdministratorAccess` podemos ponerle como nombre `terraform-lab`
  - Le habilitas el acceso via CLI
  - Guardas el Access Key y Secret Access Key (Estos seran los que utilizara terraform para interactuar con AWS)

3. Como estamos utilizando AWS, necesitamos el [aws provider](https://registry.terraform.io/providers/hashicorp/aws/latest) para terraform asi que creamos un archivo `main.tf` para configurar nuestra infraestructura:
  - Agregamos esto a nuestro archivo `main.tf`
    ```terraform
      terraform {
        required_providers {
          aws = {
            source = "hashicorp/aws"
            version = "5.87.0"
          }
        }
      }

      provider "aws" {
        region = "us-east-1"
        access_key = var.access_key
        secret_key = var.secret_key
      }
    ```
  - Para poder utilizar las variables, tendremos que crear un archivo `variables.tf` en el directorio `terraform` que contendra las variables de AWS:
    ```terraform
        variable "access_key" {
          description = "access_key"
          type        = string
          sensitive   = true
        }

        variable "secret_key" {
          description = "secret_key"
          type        = string
          sensitive   = true
        }
    ```
  - Y ademas debemos crear el archivo `terraform.tfvars` con las variables de AWS:
    ```tfvars
      access_key="aws_access_key"
      secret_key="aws_secret_key"
    ```
  - Ahora podemos usar el comando `terraform init` o usando nuestro alias `tf init` para inicializar backend de terraform, este tendra toda la configuracion necesaria y el estado de nuestra infraestructura, esto no lo subiremos al repo.



