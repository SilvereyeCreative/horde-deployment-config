#!/bin/sh
sudo sysctl net.ipv4.ip_unprivileged_port_start=80
podman-compose up -d
until curl -s http://localhost:80 > /dev/null; do
  echo "Waiting for NGINX to start..."
  sleep 1
done
sudo sysctl net.ipv4.ip_unprivileged_port_start=1024
