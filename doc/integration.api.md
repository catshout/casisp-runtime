# Integration APIs

## Configuration

An Integration API does contain the following parameters:
````json
{
    "version": "1.0.0",
    "deployDev": true,
    "deployTest": false,
    "deployProd": false,
    "contextPath": "greetings",
    "basePath": "say",
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
    "cors": {
        "enable": true,
        "corsHeaders": [
            {
                "origin": "*",
                "methods": "GET, HEAD, POST, PUT, DELETE, TRACE, OPTIONS, CONNECT, PATCH",
                "headers": "Origin, Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers",
                "maxAge": 3600
            }
        ]
    },
    "apiId": "greetings",
    "apiName": "Greetings",
    "description": "Greetings - Test API",
    "endpoint": [
        {
            "uri": "hello",
            "method": "get",
            "serviceEndpoint": [
                {
                    "type": "direct-vm",
                    "someName": "helloLabel"
                }
            ]
        },
        {
            "uri": "bye",
            "method": "get",
            "serviceEndpoint": [
                {
                    "type": "direct-vm",
                    "someName": "byeLabel"
                }
            ]
        }
    ]
}
````
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|version| |optional, semantic version of the Integration API|
|deployDev| |not used in casisp-runtime|
|deployTest| |not used in casisp-runtime|
|deployProd| |not used in casisp-runtime|
|contextPath|X|context path of the API|
|basePath|X|base path of the API|
|etc| |creates the authentication file|
|etc.fileCreateFlag| |constant value `true`, will be used for authentication file configuration|
|etc.filePrefix| |constant value `org.ops4j.pax.web.context-admin`, will be used for authentication file configuration|
|etc.basicAuthentication.credentials.rolename| |rolename from `users.properties` file|
|cors| |CORS parameters|
|cors.enable| |`true` (if CORS enabled) or `false` (if CORS disabled)|
|cors.origin| |CORS origin parameter|
|cors.methods| |CORS methods parameter|
|cors.headers| |CORS header parameter|
|cors.maxAge| |CORS maxAge parameter|
|apiId|X|semantic ID of the Integration API, must be unique|
|apiName|X|name of the Integration Service|
|description| |description of the Integration Service|
|endpoint.uri|X|URI of the endpoint|
|endpoint.method|X|HTTP method of the endpoint, could be either `get`, `post`, `put` or `delete`|
|endpoint.description| |description of the endpoint|
|endpoint.serviceEndpoint|X|multiple service endpoints|
|endpoint.serviceEndpoint.type|X|service endpoint type, either `direct-vm` or `jms`|
|endpoint.serviceEndpoint.someName| |name of the `direct-vm` service endpoint (label)|
|endpoint.serviceEndpoint.jms.type|(X)|type of the JMS service endpoint, either `queue` or `topic`|
|endpoint.serviceEndpoint.jms.destinationName|(X)|name of the JMS service endpoint|

## Deployment

The Integration API model can be sent to the deployment API as following (Windows):
````
deploy-api.bat <api.model.json>
````
or (Linux):
````
./deploy-api.sh <api.model.json>
````
The request will be validated against the JSON Schema first before processing and deploying. If the request has been successfully parsed the response looks like:
````json
{
    "responseCode": 200,
    "responseMessage": "API model 'greetings' succesfully parsed and deployment initiated."
}
````
Please check the Apache Camel log for the asynchronous deployment success. The Apache Camel log inside the Docker container can be checked either through the `hawtio` UI with
````
https://localhost:8443/hawtio
````
or with the commands
````
docker exec -it casisp /bin/bash
cd /opt/apache-karaf/data/log
cat karaf.log
````
