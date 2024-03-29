# casisp-runtime

[![Release 0.9.3](https://img.shields.io/badge/release-0.9.3-brightgreen.svg?style=flat)](https://github.com/catshout/casisp-runtime/archive/v0.9.3.zip "casisp-runtime 0.9.3")

The `casisp-runtime` is an Open Source integration runtime container that:
- is based on a Docker image that needs less than 5 minutes setup
- uses Apache Karaf runtime and Apache Camel components
- supports a model driven approach for Integration Service and API deployment

It is intended to get commonly needed Integration Services up-and-running in a very small amount of time and with no or less knowledge of the Apache Karaf and Apache Camel details. 

![alt text](casisp-runtime.png "Component overview")

The `casisp-runtime` contains a set of component Apache Velocity Templates for well tested XML DSL snippets of the mostly used Apache Camel components. Two main Apache Velocity Templates contain further the skeletons for an Integration Service and an Integration API.
The deployed Integration Services and Integration APIs will be running as Apache Camel Routes within the Docker based Runtime.

The JSON Schemas [integrationservice.schema.json](bin/var/casisp/templates/schema/integrationservice.schema.json) and [integrationapi.schema.json](bin/var/casisp/templates/schema/integrationapi.schema.json) define the JSON model for the Apache Camel Components configuration.

Additional Apache Camel components can be included into the `casisp-runtime` based on JSON schema extensions and additional Apache Velocity templates.

The `casisp-runtime` can be supplemented with a graphic UI for the Integration Service and API design and with an Integration Process Monitor. Both are commercial products of the [CAS AG](https://www.c-a-s.de). The `casisp-runtime` will remain Open Source under the Apache 2.0 license.

## Pre-requisites

The following pre-requisites are required to run the `casisp-runtime`

### Windows

- will follow

### Linux

- [Docker Engine for Linux](https://docs.docker.com/engine/install/)
- User account casisp:casisp with the uid:gid 2000:2000
- all `*.sh` scripts must be executable
- Base directory `/var/casisp` with the casisp:casisp ownership

## Setup the Apache Camel runtime

The foundation is a ready-to-run docker container based on [Apache Karaf 4.4.2](https://karaf.apache.org/) and [Apache Camel 3.20.2](https://camel.apache.org/). Once the pre-requisites are given you can move into the folder `bin` and start the container with (Linux):
````
./create-casisp.sh
````
The Docker container contains the following artefacts:

````
feature hawtio 2.17.0
feature activemq 5.17.4
feature 3.20.2
````
## Creating the first Integration Service

The first service is a HTTP based "Hello World!" Integration Service. The JSON Model looks like following:
````json
{
    "version": "1.0.0",
    "deployDev": true,
    "deployTest": false,
    "deployProd": false,
    "serviceId": "hello",
    "serviceName": "Hello World",
    "process": {
        "processId": "hello"
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
                "contextPath": "hello",
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
The `casisp-runtime` does have a deployment API that expects the JSON Model in a POST request body. For the first start the `casisp-runtime` is being delivered with a deployment script for Linux. These expect a parameter for a file containing the JSON model for an Integration Service or Integration API.

The "Hello World!" Integration Service can be deployed as following (Linux):
````
./deploy-service.sh ../samples/hello.json
````
If the request has been successfully the response looks like:
````json
{
    "responseCode": 200,
    "responseMessage": "Service model 'hello' successfully parsed and deployment initiated."
}
````
The Integration Service can be called with (Linux):
````
curl --insecure --request GET 'https://localhost:8443/hello/get' -u admin:passw0rd
````
The response of the "Hello World!" Integration Service looks like:
````
Hello World!
````

## Standard user

The Apache Karaf standard user is
````
admin
passw0rd
````
To modify this user you must edit the `etc/users.properties` file. The admin user is also securing the deployment API. When changing the standard user and password the file `var/casisp/deploy/isp.activemqConnectionFactory.xml` needs to be changed as well. It contains the access data for the built-in ActiveMQ broker.

For further details and component references follow the documentation links below.

## Integration Services

- [Integration Service deployment](doc/integration.service.md)

## Integration APIs

- [Integration API deployment](doc/integration.api.md)
