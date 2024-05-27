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
docker-compose down && docker-compose up -d
if [ $? -eq 0 ]; then
    echo " ** Docker container started successfully"
    echo ""
    echo " Access web interface on port 5601"
    echo " Go to Stack Management > Index Patterns"
    echo " Create index pattern"
    echo " Enter cowrie-* as the index pattern"
    echo " Select @timestamp as the Time Filter"
    echo ""
else
    echo " ** Docker container failed to start"
fi
