# Horde Server Deployment
Tested on AlmaLinux 10

## Steps:
1. Get a LetsEncrypt certificate with `certbot --standalone`.
1. Change certificate permissions as described in docker-compose.yml/nginx/volumes.
1. Clone this repo.
1. Execute `./run.sh` (will ask for sudo permission briefly to allow privileged port access).

## To Do:
- Actually configure the server with Perforce and UGS etc.

## Extras
Docker stop all command:
`sudo docker stop $(sudo docker ps -q)`
Podman stop all command:
`podman rm -a -f`
