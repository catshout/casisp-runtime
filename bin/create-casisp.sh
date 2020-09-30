#!/bin/bash
cd docker
docker-compose -f docker-compose_Linux.yml up --build -d
cd ..
