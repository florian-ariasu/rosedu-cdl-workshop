#!/bin/sh

container_stop_and_remove()
{
    name="$1"

    # Check if container is running.
    if test "$(docker container inspect -f '{{.State.Running}}' "$name" 2> /dev/null)" = "true"; then
        # Stop container if it running.
        echo "Stopping container $name ... "
        docker stop "$name"
    fi

    # Check if container exists.
    docker container inspect "$name" > /dev/null 2>&1
    if test $? -eq 0; then
        # Remove container if it exists.
        echo "Removing container $name ... "
        docker rm "$name"
    fi
}

container_stop_and_remove "cdl-nginx"
container_stop_and_remove "ctf-piece_of_pie"
container_stop_and_remove "cdl-caddy"
container_stop_and_remove "cdl-debian-bash"

# Start Nginx container
./vanilla-nginx/run-nginx-container.sh

# Start CTF container
cd ctf/deploy
make run
