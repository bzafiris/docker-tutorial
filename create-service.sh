#!/bin/bash
cd flask 

# Create a user-defined bridge network
docker network create my-net

# Create a volume for storing Redis data
docker volume create redis-data

# Create an image from local Dockerfile
docker build -t flask:1.0 .

# Create a flask container named web,
#    attach it to network my-net,
#    publish port 5000 to port 80 of docker host
docker create --name web    --network my-net \
                            --publish 80:5000 flask:1.0

# Create a redis container named db 
#    from image redis:5.0.5-alpine3.9,
#    mounts volume redis-data to container directory /data,
#    attaches to network my-net,
#    executes redis-server on startup
docker create --name db --network my-net \
                        --volume redis-data:/data \
                        redis:6.2.6-alpine redis-server

# Start containers
docker start web db

cd ..


