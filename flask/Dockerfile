FROM python:3.7.3-alpine3.9

ENV FLASK_APP app.py
ENV FLASK_RUN_HOST 0.0.0.0

# Copy python requirements document
COPY ./requirements.txt /requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r /requirements.txt

# Copy the current directory contents into the container at /app
# COPY ./app /app
VOLUME ["/app"]

# Set the working directory to /app
WORKDIR /app

# Set the command to run on container start up
ENTRYPOINT ["flask", "run"]
