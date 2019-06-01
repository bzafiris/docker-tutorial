#!/bin/bash

# 1. Create a bridge network with name my-net
docker network create my-net

# 1. Create a redis container with name db 
#    from image redis:5.0.5-alpine3.9 
#    that attaches to network my-net
#    and executes redis-server on startup
docker create --name db --network my-net redis:5.0.5-alpine3.9 redis-server

# 2. Start db container
docker start db

# 3. Create custom image from local Dockerfile, named flask:latest
docker build -t flask:latest .

# 4. Create a flask container with name web 
#    from Dockerfile specified image
#    that attaches to network my-net
#    and exports port 5000
docker create --name web --network my-net -p 5000:5000 flask:latest

# 5. Start web container
docker start web