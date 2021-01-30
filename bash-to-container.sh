#!/usr/bin/env bash
containers=$(docker container ls --format={{.Names}})
if [[ $containers ]]; then
    echo "Running containers:"
    docker container ls --format={{.Names}}
    read -p "Container name: " container_name
    docker exec -it "$container_name" bash || docker exec -it "$container_name" sh
else
    echo "No running containers found"
fi
# if there is no bash one can try 'sh'