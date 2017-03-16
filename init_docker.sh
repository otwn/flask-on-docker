#!/bin/bash
docker stop py35-flask-docker
docker rm py35-flask-docker

docker build -t py35-flask-docker-img . 

docker run -d --name py35-flask-docker -p 8000:80 py35-flask-docker-img

