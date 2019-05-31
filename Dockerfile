FROM python:3.7.3-alpine3.9
# Dockerfile available in https://github.com/docker-library/python/blob/34c9df35e9a69e9f0edde88e861b543edb8bc07a/3.7/alpine3.9/Dockerfile

ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0

# Copy python requirements document
COPY ./requirements.txt /requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r /requirements.txt

# Copy the current directory contents into the container at /app
COPY ./app /app

# Set the working directory to /app
WORKDIR /app

CMD ["flask", "run"]
