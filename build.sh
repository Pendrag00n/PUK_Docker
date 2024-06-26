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

echo " ** Testing if port 22 is in use"
if ss -tuln | grep -q ':22\b'; then
    echo "Port 22 is in use. Exiting..."
    exit 1
else
    echo " ** Port 22 is not in use."
fi

echo " ** Changing dir permissions"
sudo chmod -R 777 *

echo " ** Building the docker image and starting the container..."
docker-compose down && docker-compose up -d
if [ $? -eq 0 ]; then
    echo " ** Docker container started successfully!"
else
    echo " ** Docker container failed to start"
    exit 1
fi

until $(curl --output /dev/null --silent --head --fail http://127.0.0.1:5601); do
    echo " ** Waiting for Kibana to be available..."
    sleep 10
done
echo ""
echo " Access web interface on port 5601"
echo " Go to Stack Management > Index Patterns"
echo " Create index pattern"
echo " Enter cowrie-* as the index pattern"
echo " Select @timestamp as the Time Filter"
echo ""
