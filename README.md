# Silvereye Horde Server Deployment
Tested on AlmaLinux 10 with unprivileged user.

## Steps:
1. `sudo dnf update` and `sudo dnf install podman-compose`
1. Set up firewall to allow through http and https:

`sudo firewall-cmd --zone=public --add-service=http --permanent`

`sudo firewall-cmd --zone=public --add-service=https --permanent`

`sudo firewall-cmd --reload`

1. Get a LetsEncrypt certificate with `certbot --standalone`.
1. Change certificate permissions as described in `docker-compose.yml/nginx/volumes`.
1. Clone this repo.
1. Execute `./run.sh` (will ask for sudo permission to allow a brief privileged port bind access).

## To Do:
- Actually configure the server with Perforce and UGS etc.

## Podman commands
List all running containers:

`podman ps`

Podman stop all command:

`podman rm -a -f`
