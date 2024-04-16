#!/bin/bash

# 1. Remove web container, force if already running or stopped
docker rm -f web 

# 2. Remove db container, force if already running or stopped
docker rm -f db

# 3. Remove network my-net
docker network rm my-net