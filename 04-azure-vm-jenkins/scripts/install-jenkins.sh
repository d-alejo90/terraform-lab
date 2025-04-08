#!/bin/bash

# Actualizar sistema
sudo apt-get update -y
sudo apt-get upgrade -y

# Instalar Java (Jenkins lo necesita)
sudo apt install fontconfig openjdk-17-jre -y

# Agregar repositorio de Jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list >/dev/null

# Instalar Jenkins
sudo apt-get update -y
sudo apt-get install jenkins -y

# Habilitar y arrancar Jenkins
sudo systemctl enable jenkins
sudo systemctl start jenkins
