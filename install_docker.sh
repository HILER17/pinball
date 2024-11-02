#actualizar el sistema
echo "Updating..."
sudo apt update -y

#limpieza paquetes previos de docker
echo "cleaning"
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containered runc; do
    sudo apt-get remove-y $pkg
done

#Instalacion dependencias
echo "instalando dependencias"
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

#añadir a APT sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-relase && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#intalar Docker
echo "Instalando docker"
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#verificacion del docker
sudo systemctl status docker

#arrancar el docker
echo "iniciando el servicio de docker"
sudo service docker start

# agregar usuario al grupo 'docker' "
sudo groupadd docker
sudo usermod -aG docker $USER

echo "docker  instalado e iniciado"
echo "para ejecutar docker sin el comandop sudo reinicia la terminal o utiliza el comando 'newgrp docker'" 
