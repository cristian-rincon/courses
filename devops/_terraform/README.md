# Curso de terraform

## Comandos útiles

| Comando                                   | Descripción                                                                           |
| ----------------------------------------- | ------------------------------------------------------------------------------------- |
| `terraform init `                         | Inicializa y descarga los plugins del provider                                        |
| `terraform validate `                     | Valida que la sintaxis de los archivos sea correcta                                   |
| `terraform plan `                         | Muestra los recursos que va a crear en consola antes de crearlos en el cloud provider |
| `terraform plan -var-file dev.tfvars `    | Usando el flag podemos especificar el archivo de variables de entorno                 |
| `terraform apply `                        | Aplica los cambios en el cloud provider                                               |
| `terraform destroy -var-file dev.tfvars ` | Destruir la infraestructura creada                                                    |

- Si un archivo de variables tiene la extensión auto, terraform lo tomará sin tener que especificar su nombre a través del flag -var-file.
  - Ejemplo: `prod.auto.tfvars`
