# Autostart docker-machine default.
DOCKER_MACHINE_AUTOSTART='false'
DOCKER_MACHINE_NAME='dev'

# Small helper to configure docker.
function _loaddocker() {
    if [ ! -f /tmp/.dockercache ]; then
	echo "Starting docker machine..."
	docker-machine start $DOCKER_MACHINE_NAME
	echo "Docker Started."
	docker-machine env   $DOCKER_MACHINE_NAME > /tmp/.dockercache
	docker-machine ip    $DOCKER_MACHINE_NAME > /tmp/.dockerip
    fi
    export DOCKER_IP=$(cat /tmp/.dockerip)
    eval $(cat /tmp/.dockercache)
}

function loaddocker() {
    echo "Loading docker config..."
    _loaddocker $@
}

function dockerclear {
    \rm -f /tmp/.dockercache /tmp/.dockerip
   loaddocker
}

# Default to "default" as docker-machine name.
[ -z "$DOCKER_MACHINE_NAME" ] && export DOCKER_MACHINE_NAME="default"
# If requested, auto start the docker-machine
[ "$DOCKER_MACHINE_AUTOSTART" = true ] && loaddocker $DOCKER_MACHINE_NAME

# Helper aliases and functions.
alias dkrsh='docker run --rm -it --entrypoint /bin/bash'
