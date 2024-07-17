#!/bin/bash

# Install Node Exporter on Ubuntu

# Update system packages
# sudo apt update && sudo apt upgrade -y

# Create a user for Node Exporter
sudo useradd -rs /bin/false node_exporter

# Download the latest Node Exporter version
VER="1.8.2"  # Update this version number if a newer version is available
wget https://github.com/prometheus/node_exporter/releases/download/v${VER}/node_exporter-${VER}.linux-amd64.tar.gz
tar xvf node_exporter-${VER}.linux-amd64.tar.gz

# Move the binary and set permissions
sudo mv node_exporter-${VER}.linux-amd64/node_exporter /usr/local/bin/
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

# Download the Systemd service file from your GitHub repository
sudo wget -O /etc/systemd/system/node_exporter.service https://raw.githubusercontent.com/rezalabs/systemd-service-file-collection/main/node_exporter.service

# Start and enable Node Exporter service
sudo systemctl daemon-reload
sudo systemctl start node_exporter
sudo systemctl enable node_exporter

# Verify Node Exporter is running
sudo systemctl status node_exporter

# Cleanup downloaded files
rm -rf node_exporter-${VER}.linux-amd64*
