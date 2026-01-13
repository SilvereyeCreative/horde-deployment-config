# Silvereye Horde Server Deployment
Tested on AlmaLinux 10 with unprivileged user.

## Steps:
### Part 1: System config
1. `sudo dnf update` and `sudo dnf install podman-compose`.
1. Set up firewall to allow through http and https:
    - `sudo firewall-cmd --zone=public --add-service=http --permanent`
    - `sudo firewall-cmd --zone=public --add-service=https --permanent`
    - `sudo firewall-cmd --reload`
    - (Check with `sudo firewall-cmd --list-services`)
1. Run `sudo bash -c 'echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf'` and `sudo sysctl --system` so Redis doesn't complain.
1. Clone this repo and cd in.

### Part 2: SSL Certificate with auto-renewal
1. Install [certbot](https://certbot.eff.org/instructions?ws=other&os=snap&tab=standard) with snap.
1. Run `./get_cert.sh` to start the stub nginx server and run certbot with the webroot plugin.
1. Change certificate permissions as described in `docker-compose.yml/nginx/volumes`.
1. Set up certificate post-renew hook to reload nginx with `sudo ln -sr nginx_reload.sh /etc/letsencrypt/renewal-hooks/post/nginx_reload.sh`.

### Part 3: Final configuration
1. Change MongoDB password with `sed -i -e 's/MDB_PSWD/your_secure_password/g' docker-compose.yml`, replacing `your_secure_password`.
1. Login to podman with a GitHub account with access to the Unreal Source Code (for `horde-server` package access): `podman login ghcr.io`. You'll need a classic PAT.

### Part 4: Run the server
1. Execute `./run.sh` (will ask for sudo permission to allow a brief privileged port bind access).

## To Do:
- Actually configure the server with Perforce and UGS etc.

## Useful commands
List all running containers:

`podman ps`

Podman stop all containers:

`podman rm -a -f`

Reset everything:

`podman system reset`

See which ports are in use:

`sudo ss -tulnp`
