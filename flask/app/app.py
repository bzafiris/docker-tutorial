import time

import redis
from flask import Flask

import socket

app = Flask(__name__)
cache = redis.Redis(host='db', port=6379)


def get_hit_count():
    retries = 5
    while True:
        try:
            return cache.incr('hits')
        except redis.exceptions.ConnectionError as exc:
            if retries == 0:
                raise exc
            retries -= 1
            time.sleep(0.5)


@app.route('/')
def hello():
    count = get_hit_count()
    #count = 0
    host_name = socket.gethostbyname(socket.gethostname())
    return '[{}] Hello World! I have been seen {} times.\n'.format(host_name, count)