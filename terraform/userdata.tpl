#!/bin/bash
sudo apt update && sudo apt upgrade -y &&
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y &&
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg -y &&
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null &&
sudo apt update -y &&
sudo apt install docker-ce -y &&
sudo usermod -aG docker ${USER} &&
sudo apt install docker-compose -y &&
git clone https://github.com/twyle/flask-ec2-terraform-deployment &&
mkdir /home/${USER}/app &&
mkdir /home/${USER}/app/web &&
mkdir /home/${USER}/app/database &&
touch /home/${USER}/app/web/.env &&
echo FLASK_DEBUG=True >> /home/${USER}/app/web/.env &&
echo FLASK_ENV=development >> /home/${USER}/app/web/.env &&
echo FLASK_APP=manage.py >> /home/${USER}/app/web/.env &&
docker-compose -f flask-ec2-terraform-deployment/docker-compose-dev.yml up --build