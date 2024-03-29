# Consumer HTTP
The HTTP Consumer provides an HTTP endpoint with an optional basic authentication. It runs on the same port as the HTTP server, basically configured with port 8443.

## Configuration example
````json
{
    "consumerType": "http",
    "http": {
        "etc": {
            "fileCreateFlag": true,
            "filePrefix": "org.ops4j.pax.web.context-admin",
            "basicAuthentication": {
                "credentials": [
                    {
                        "rolename": "role1"
                    },
                    {
                        "rolename": "role2"
                    }
                ]
            }
        },
        "contextPath": "context",
        "relativePath": "path",
        "blueprint": {}
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|etc| |creates the authentication file|
|etc.fileCreateFlag| |constant value `true`, will be used for authentication file configuration|
|etc.filePrefix| |constant value `org.ops4j.pax.web.context-admin`, will be used for authentication file configuration|
|etc.basicAuthentication.credentials.rolename| |rolename from `users.properties` file|
|contextPath|X|URL context path|
|relativePath|X|URL relative path|
|blueprint|X|empty but must be set for configuration on blueprint level|

The configuration above provides an HTTP endpoint like
````bash
https://{servername}:8443/context/path
````
with the allowed access for all users that have either `role1` or `role2` assigend in `etc/users.properties` like:
````bash
user1 = passw0rd:role1
user2 = passw0rd:role2
````
