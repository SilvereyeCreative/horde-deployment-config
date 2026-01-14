#!/bin/sh
runuser -l linuxuser -c "podman exec horde_nginx nginx -s reload" 2>&1
