## Comandos útiles

```bash

docker run hello-world # Corre el contenedor más básico de docker.

docker ps # Ver los contenedores que estamos corriendo en el momento.

docker ps -a # Ver todos los contenedores que se han corrido en la máquina.

docker run --name <name> <image> # colocar un nombre custom al contenedor

docker rename <actual-name> <new-name> # Renombrar un contenedor

docker rm <container-id> ó <container-name> # Borrar un contenedor

docker container prune # Borrar todos los contenedores detenidos

docker stop <container-name> # Detiene el contenedor

```

## Usando el modo interactivo

```bash
docker run ubuntu # Descarga una imagen liviana de ubuntu
docker run -it <imagen> # modo interactivo

docker run --name <nombre> -d ubuntu tail -f /dev/null # Corre el proceso principal e impide que se muera el proceso

docker exec -it <nombre> bash # Usar un nuevo proceso dentro del contenedor
docker inspect --format '{{.State.Pid}}' <nombre>
kill -9 Pid

```

## Exponiendo contenedores

Cada contenedor tiene su propio stack de networking.

```bash
docker run -d --name proxy nginx

docker rm proxy

docker run --name proxy -p 8080:80 nginx # Se ven los logs en el stdout
docker run --name proxy -d -p 8080:80 nginx # No se ven los logs en el stdout

```

## Bind mounts

```bash
docker run -d --name db mongo
docker run -d --name db -v /home/crincon/Documentos/estudio/curso-docker/docker_data/mongodata:/data/db mongo
```

## Volumes

Los archivos dentro de un volumen solo son visibles dentro del contenedor.

```bash
docker ps
docker rm -f db
docker volume
docker volume ls
docker volume create dbdata
docker volume ls
docker run -d --name db --mount src=dbdata,/data/db mongo
docker run -d --name db --mount src=dbdata,dst=/data/db mongo
docker instpect db
docker inspect db
docker exec -it db bash
docker rm -f db
docker run -d --name db --mount src=dbdata,dst=/data/db mongo
docker exec -it db bash
```

## Insertar y extraer archivos de un contenedor `docker cp`

```bash
echo "hello" > hello.txt
docker run -d --name copytest ubuntu tail -f /dev/null
docker ps
docker exec-it copytest bash
docker exec -it copytest bash
docker cp hello.txt copytest:/testing/hello_test.txt
docker exec -it copytest bash
docker cp copytest:/testing localtesting
ll
ls localtesting

```

## Imágenes en Docker

### Traer desde dockerHub

```bash
docker pull ubuntu:20.04
docker image ls
```

### Crear nuestra propia imagen

Se usa el archivo Dockerfile, allí le pasamos los comandos que se deben ejecutar en la terminal al momento de inicializarla.

Lo que está en el dockerfile, se ejecuta solo al momento del build

Construir la imagen

```bash
docker build -t ubuntu:platzi .
```

Enviarla a dockerHub

```bash
docker tag ubuntu:platzi uncristianr/ubuntu:platzi
docker push
```

## El sistema de capas

https://github.com/wagoodman/dive

```bash
docker history ubuntu:platzi
# Usando Dive
dive ubuntu:platzi
```

## Usando Docker para desarrollar aplicaciones

```bash
git clone https://github.com/platzi/docker
docker build platziapp . (creo la imagen local)
docker image ls (listo las imagenes locales)
docker run --rm -p 3000:3000 platziapp
```

## Aprovechando el caché de capas para estructurar correctamente tus imágenes

```bash
docker run --rm -p 3000:3000 -v $(pwd):/usr/src platziapp
docker run --rm -p 3000:3000 -v $(pwd)/index.js:/usr/src/index.js platziapp
```

## Docker networking: colaboración entre contenedores

```bash
docker ps
docker network connect platzinet db
docker network inspect platzinet
docker run -d --name app -p 3000:3000 --env MONGO_URL=mongodb://db:27017/test platziapp
docker ps
docker network connect platzinet app
docker network inspect
docker network inspect platzinet
```

## Docker Compose: la herramienta todo en uno

Describir de forma declarativa la arquitectura de nuestros servicios.

version:
La versión del compose file tiene que ver con los features que soporta docker compose. NO puede colocarse una versión "latest", se debe especificar el número de la versión.

services:
Los distintos componentes que necesita la app para poderse ejecutar correctamente.

app:
Describe una parte de la aplicación.

image: especifica la imagen a usar para el container.
environment: para colocar las variables de entorno.
depends_on: los contenedores de el servicio dependen de el contenedor que coloquemos en esta variable.

ports: especifica los puertos que quieres exponer.

db:
El servicio que correrá la base de datos.

## Subcomandos de Docker Compose

```bash
docker-compose logs app
docker-compose logs -f app
docker-compose exec app bash
docker-compose ps
docker-compose down
```

## Compose en equipo: override

Se usa el archivo docker-compose.override.yml

### Escalando los servicios

```bash
docker-compose up -d --scale app=2
```

## El contexto de build

Cada vez que vamos a hacer un build, docker va a montar los archivos disponibles en la ruta que le paso como último parámetro al docker build.

Para excluir archivos podemos usar el .dockerignore