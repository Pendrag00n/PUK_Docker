#!/bin/bash

echo " ** Testing docker installation"
if [ -x "$(which docker)" ]; then
    echo " ** docker is already installed"
else
    echo " ** Installing docker"
    curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh
fi
echo " ** Testing docker-compose installation"
if [ -x "$(which docker-compose)" ]; then
    echo " ** docker-compose is already installed"
else
    echo " ** Installing docker"
    sudo apt install docker-compose -y
fi

echo " ** Building the docker image and starting the container..."
docker-compose down && docker-compose up
if [ $? -eq 0 ]; then
    echo " ** Docker container started successfully"
else
    echo " ** Docker container failed to start"
fi
