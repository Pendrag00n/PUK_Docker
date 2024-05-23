#!/bin/bash
echo " ** Installing docker-compose"
sudo apt install docker-compose -y
echo " ** Building the docker image and starting the container..."
docker-compose up --build
if [ $? -eq 0 ]; then
    echo " ** Docker container started successfully."
else
    echo " ** Docker container might've failed to start."
fi
