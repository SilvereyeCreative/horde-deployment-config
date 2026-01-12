# Horde Server Deployment
Tested on AlmaLinux 10

## Steps:
1. Get a LetsEncrypt certificate with `certbot --standalone`
2. Install docker
3. Clone this repo and cd in
4. `sudo docker compose up`

## To Do:
- Try with podman
- Try with rootless
- Actually configure the server with Perforce and UGS etc.

## Extras
Docker stop all command:
`sudo docker stop $(sudo docker ps -q)`
