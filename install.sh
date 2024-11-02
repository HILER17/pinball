#!/bin/bash

# Actualiza el sistema
sudo apt update -y

# Descargar e instalar AWS CLI
sudo apt install curl
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Descargar e instalar Terraform
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt install terraform

# Configura AWS CLI automáticamente
aws configure set aws_access_key_id "ASIA5X7MTMLXX5CHWDOB"
aws configure set aws_secret_access_key "J8GbclBBI2PvyyKcRKj27T2XS/07lyTuEHkNvUz5"
aws configure set region "us-east-1"
aws configure set output "json"

# Reemplaza el archivo de credenciales
CREDENTIALS_FILE="$HOME/.aws/credentials"
echo "[default]" > $CREDENTIALS_FILE
echo "aws_access_key_id=ASIA5X7MTMLXX5CHWDOB" >> $CREDENTIALS_FILE
echo "aws_secret_access_key=J8GbclBBI2PvyyKcRKj27T2XS/07lyTuEHkNvUz5" >> $CREDENTIALS_FILE
echo "aws_session_token=IQoJb3JpZ2luX2VjEDoaCXVzLXdlc3QtMiJHMEUCIQD+zs/x2ubBNkFbyFr+c+BHA62YxqAje3kZ63I+X1/aZgIgHdoFYaHvJoRmj+tfJkAT/KxVsiiQxe9NzSwtOc8XhaIqvQIIs///////////ARAAGgw5NDQ4NTIxMzI1OTEiDFrLc9ar+mz1VglWcyqRAoMMNV9umVHNPU1CmEPYAWachxLw3xwYbJwZIcTykH7pVd7EJcl1Q2wjy3zhPuEsdhYWb5bkhYFHLq6sVwRQqMLCO3q5M4RnPW3HvARCYW8yUf3lQPafoc7zoj+jnQy464zzhGRjFytJIrwRPFU5/gVaIWTle41SGe6VEjEm6w/EuNW+k+Fw+ErTFtlQGYYJo3m2zJpJHUOq3vq2H/v1tmc96QsZP4bJRXkgzfXwGYEnGh8xB6/AK4nKxpWobbPSdWAC03vLbgH0YbTxTUHnhii/uJghVdk4ldkVHiw6vTrouR3YjFw2OYj2TthCpygIDwQiPS2nhlExH/40JQ1sQmdEjSnABelDma10xR2/2TT7IzCKiZa5BjqdAUtNz0kVB++PReFEc441imw46pGCo/LHRWyPnXIn8YtWMe7rHtmUlhX3yGT+XnL3uCJa7zVJa9lZwIGZHJbbkLYTAALS51KMD3ONNn5yvtwAdJ1Xd30wno5iEqBfQi8t1km+sy0rNswx1auseuS0vD5e7KmvXZ7GlMem68E07fYbd1Dv+l+IkizdHLx4OA+rtVV9PtnY2PPji/6MpQQ=" >> $CREDENTIALS_FILE

#Iniciar el terraform
cd proyecto
cd examen
terraform init
terraform plan
terraform apply -auto-approve
