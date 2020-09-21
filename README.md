# casisp-runtime

The purpose of the casisp-runtime is to setup, configure and run Apache Camel based integration services in a small amount of time and with no or less knowledge of the Apache Camel components.

![alt text](casisp-runtime.png "Component overview")

It comes first with a set of Apache Velocity Templates that contain a ready to run DSL snippets for the mostly used Apache Camel components. Two frame Apache Velocity Templates contain further the skeleton for an Integration Service and an Integration API.
Finally an Integration Service and an Integration API will be running as an Apache Camel Route on the Docker based Runtime.

The second important parts are the JSON Schemas [integrationservice.schema.json](model/integrationservice.schema.json) and [integrationapi.schema.json](model/integrationapi.schema.json). These JSON Schemas define the JSON model for the Apache Camel Components configuration.

## Pre-requisites

Following pre-requisites are required to run the casisp-runtime

### Windows

- [Docker Desktop for Windows](https://hub.docker.com/editions/community/docker-ce-desktop-windows)
- Drive E: (can be changed within the file [docker-compose_Windows.yml](docker/docker-compose_Windows.yml))
- Base directory `E:\var\casisp` with the copy of [var/casisp](var/casisp)

### Linux

- [Docker Engine for Linux](https://docs.docker.com/engine/install/)
- User account casisp:casisp with the uid:gid 2000
- Base directory `/var/casisp` with the copy of [var/casisp](var/casisp)

## Setup the Apache Camel runtime

The foundation is a ready-to-run docker container. Once the pre-requisites are given you can move into the folder `docker` and start the container with

````
start-casisp.bat
````
or
````
start-casisp.sh
````
The Docker container ist based on following artefacts:

````
feature:repo-add hawtio 2.10.1
feature:repo-add activemq 5.16.0
feature:repo-add camel 3.4.3
feature:install pax-http-undertow
feature:install hawtio activemq-broker-noweb camel camel-jms jms camel-http camel-servlet camel-swagger-java camel-ftp camel-jackson camel-jsonpath camel-zipfile camel-velocity camel-groovy camel-salesforce camel-kafka
````
## Creating the first Integration Service

The first service is a HTTP based "Hello World!" Integration Service. The JSON Model looks like following:
````json
{
    "version": "1.0.0",
    "deployDev": true,
    "deployTest": false,
    "deployProd": false,
    "serviceId": "TSTISP001",
    "serviceName": "Testservice HTTP 1",
    "process": {
        "processId": "TSTISP001"
    },
    "consumer": [
        {
            "consumerType": "http",
            "http": {
                "etc": {
                    "fileCreateFlag": true,
                    "filePrefix": "org.ops4j.pax.web.context-admin",
                    "basicAuthentication": {
                        "credentials": [
                            {
                                "rolename": "admin"
                            }
                        ]
                    }
                },
                "blueprint": {},
                "contextPath": "tstisp001",
                "relativePath": "get"
            }
        }
    ],
    "processor": [
        {
            "processorType": "setBody",
            "setBody": {
                "language": "constant",
                "expression": "Hello World!"
            }
        }
    ],
    "producer": []
}
````
The casisp does have a deployment API that expects the JSON Model within a POST request. The "Hello World!" Integration Service can be deployed as following:
````
curl --location --request POST 'https://localhost:8443/casisp/deploy/service' \
--header 'Authorization: Basic YWRtaW46cGFzc3cwcmQ=' \
--header 'Content-Type: application/json' \
--data-raw '{}'
````
The `--data-raw` parameter needs to be filled with the JSON Model shown above. If the request has been successfully the response looks like:
````json
{
    "responseCode": 200,
    "responseMessage": "Service model 'TSTISP001' succesfully parsed and deployment initiated."
}
````
The Integration Service can be called with:
````
curl --location --request GET 'https://localhost:8443/tstisp001/get' \
--header 'Authorization: Basic YWRtaW46cGFzc3cwcmQ='
````
The response of the Integration Service looks like:
````
Hello World!
````