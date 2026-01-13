# Silvereye Horde Server Deployment
Tested on AlmaLinux 10 with unprivileged user.

## Steps:
1. `sudo dnf update` and `sudo dnf install podman-compose`
1. Set up firewall to allow through http and https:

`sudo firewall-cmd --zone=public --add-service=http --permanent`

`sudo firewall-cmd --zone=public --add-service=https --permanent`

`sudo firewall-cmd --reload`

(Check with `sudo firewall-cmd --list-services`)

3. Run `sudo bash -c 'echo "vm.overcommit_memory = 1" >> /etc/sysctl.conf'` and `sudo sysctl --system` so Redis doesn't complain.
1. Clone this repo and cd in.
1. Get a LetsEncrypt certificate with [certbot](https://certbot.eff.org/instructions?ws=other&os=snap&tab=standard) and `sudo certbot certonly --webroot -w ./html`.
1. Set up certificate post-renew hook to reload nginx with `sudo ln -s nginx_reload.sh /etc/letsencrypt/renewal-hooks/post/nginx_reload.sh'`
1. Change certificate permissions as described in `docker-compose.yml/nginx/volumes`.
1. Change MongoDB password with `sed -i -e 's/MDB_PSWD/your_secure_password/g`
1. Execute `./run.sh` (will ask for sudo permission to allow a brief privileged port bind access).

## To Do:
- Actually configure the server with Perforce and UGS etc.

## Podman commands
List all running containers:

`podman ps`

Podman stop all containers:

`podman rm -a -f`

Reset everything:

`podman system reset`
