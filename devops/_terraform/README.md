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



## Implementación de módulos rutilizables de forma remota

1.  Lo primero que se debe realizar es empaquetar los módulos que se van a utilizar dentro de una carpeta cuyo nombre sea módulos(por convención). 
2.  Posteriormente, se puede crear una subcarpeta con un nombre relacionado con el tipo de infraestructura que se va a crear(instancias, storage, etc.).
3.  Reemplazar la importación del módulo en el archivo app.tf. (Es recomendable versionar solo la carpeta de los módulos cuando se van a compartir para reusarlos)

```bash
provider "google" {
  project = "pruebas-301501"
  region = "us-central1"
  zone = "us-central1-a"
}

module "app" {
  source        = "github.com/<mi_repositorio>/modulos/instance"
  instance_name = var.instance_name
  instance_type = var.instance_type
}
```



