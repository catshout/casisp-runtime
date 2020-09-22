#Consumer HTTP
The HTTP Consumer provides an HTTP endpoint with an optional basic authentication. It runs on the same port as the HTTP server, basically configured with port 8443.

##Configuration example
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
                "blueprint": {},
                "contextPath": "context",
                "relativePath": "path"
            }
        }
````
##Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|etc/fileCreateFlag| |constant value "true", will be used for authentication file configuration|
|etc/fielPrefix| |constant value "org.ops4j.pax.web.context-admin", will be used for authentication file configuration|
|basicAuthentication/credentials/rolename| |rolename from `users.properties` file|
|blueprint|X|empty but must be there for configuration on blueprint level|
|contextPath|X|URL context path|
|relativePath|X|URL relative path|

The configuration above will be provide an HTTP endpoint like
````
https://{servername}:8443/context/path
````
with the allowed access for all users that have either `role1` or `role2` assigend in `etc/users.properties` like:
````
user1 = passw0rd:role1
user2 = passw0rd:role2
````