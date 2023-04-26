#!/bin/bash
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Create directories
echo -e "${BLUE}Creating directories ...${NC}"
mkdir /var/casisp/deploy
mkdir /var/casisp/etc
mkdir /var/casisp/files
mkdir /var/casisp/templates

# Copy etc directory from base image
echo -e "${BLUE}Copying files from base image ...${NC}"
docker cp $(docker create --name tc apache/karaf:4.4.2):/opt/apache-karaf/etc /var/casisp && docker rm tc

# Add boot features
echo -e "${BLUE}Adding boot features ...${NC}"
sed -i -e '/xml\/features$/ { s/$/, \\/; r docker/featuresRepositories' -e '}' /var/casisp/etc/org.apache.karaf.features.cfg
sed -i -e '/kar\/.*$/ { s/$/, \\/; r docker/featuresBoot' -e '}' /var/casisp/etc/org.apache.karaf.features.cfg

# Enable local maven repository
echo -e "${BLUE}Enabling local maven repository ...${NC}"
echo "org.ops4j.pax.url.mvn.localRepository=/opt/apache-karaf/system" >> /var/casisp/etc/org.ops4j.pax.url.mvn.cfg

# Copy files
echo -e "${BLUE}Copying files ...${NC}"
cp -R var/casisp/* /var/casisp

# Install docker image
echo -e "${BLUE}Installing docker image ...${NC}"
docker-compose -f docker/docker-compose_Linux.yml up --build -d

# Wait for all services up and running
echo -e "${BLUE}Waiting for initialization ...${NC}"
timeout 300 bash -c 'while [[ "$(curl -s -o /dev/null -w ''%{http_code}'' --insecure --request GET 'https://localhost:8443/casisp/deploy/health' -u admin:passw0rd)" != "200" ]]; do sleep 5; done' || false

# Stop docker container
echo -e "${BLUE}Restarting in offline mode ...${NC}"
docker stop casisp

# Change maven repository to offline mode
echo "org.ops4j.pax.url.mvn.offline = true" >> /var/casisp/etc/org.ops4j.pax.url.mvn.cfg

# Start docker container
docker start casisp
echo  -e "${BLUE}CAS ISP is up and running, enjoy ...${NC}"

