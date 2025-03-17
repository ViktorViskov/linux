sudo apt autopurge "docker*" -y
sudo rm /var/lib/docker/ -rf

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
