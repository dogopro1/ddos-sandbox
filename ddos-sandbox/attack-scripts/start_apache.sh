#!/bin/bash
docker build -t ddos-apache .
docker ps -q --filter name=ddos-apache-test
if [ $? -eq 0 ]; then
  docker stop ddos-apache-test
  docker rm ddos-apache-test
fi
docker run -d --name ddos-apache-test -p 8080:80 ddos-apache
echo "Apache server running at http://localhost:8080"

