@echo off
cd docker
docker-compose -f docker-compose_Windows.yml up --build -d
cd ..
