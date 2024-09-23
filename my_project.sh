#!/bin/bash
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
docker build -t smart_home:1.0 . && docker run -d -p 8000:8000 smart_home:1.0

