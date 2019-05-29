FROM python:3.7.3-alpine3.9
# Dockerfile available in https://github.com/docker-library/python/blob/34c9df35e9a69e9f0edde88e861b543edb8bc07a/3.7/alpine3.9/Dockerfile

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY ./app /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r /app/requirements.txt
