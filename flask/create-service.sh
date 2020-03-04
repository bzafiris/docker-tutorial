#!/bin/bash

# Create a user-defined bridge network with name my-net
docker network create my-net

# Create a volume for redis data
docker volume create redis-data

# Create a redis container with name db 
#    from image redis:5.0.5-alpine3.9 
#    that mounts volume redis-data to container directory /data 
#    and attaches to network my-net
#    and executes redis-server on startup
docker create --name db --network my-net -v redis-data:/data redis:5.0.5-alpine3.9 redis-server

# Start db container
docker start db

# Create custom image from local Dockerfile, named flask:latest
docker build -t flask:latest .

# Create a flask container with name web 
#    from Dockerfile specified image
#    that attaches to network my-net
#    bind mounts the host directory app to /app inside the container
#    and exports port 5000
docker create --name web --network my-net -v "$(pwd)"/app:/app -p 5000:5000 flask:latest

# 7. Start web container
docker start web

