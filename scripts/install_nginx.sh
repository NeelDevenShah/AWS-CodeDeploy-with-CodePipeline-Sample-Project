# scripts/install_nginx.sh
#!/bin/bash
sudo apt-get update -y
sudo apt-get install -y nginx
sudo systemctl enable nginx
