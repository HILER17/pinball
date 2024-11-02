#!/bin/bash

# definicion de variables
IMAGE_NAME="pinball"
CONTAINER_NAME="pagina_pinball"

#construccion de imagen
echo "contruyendo la imagen..."
docker build -t $IMAGE_NAME

# ejecucion del docker
echo "ejecutando el contenedor..."
docker run -d --name $CONTAINER_NAME -P 80:80 $IMAGE_NAME

#end menssaje
echo "se ha creado la imagen y el contenedor"
echo "accede a la pagina https://localhost"
