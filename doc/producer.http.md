# Producer HTTP
The HTTP Producer provides an HTTP client to send HTTP requests to an HTTP endpoint. It supports Basich Authentication and NTLM. A built in error handling throws an error when an HTTP response code > 299 is being sent.

## Configuration example
````json
{
    "producerType": "http",
    "http": {
        "scheme": "https",
        "hostname": "target.com",
        "port": 8443,
        "resourceUri": "/path",
        "queryStringParameters": [
            {
                "name": "param1",
                "value": "hello"
            }
        ],
        "headers": {
            "CamelHttpMethod": "POST",
            "Content-Type": "application/json"
        },
        "authentication": [
            {
                "type": "Basic",
                "Basic": {
                    "username": "username",
                    "password": "passw0rd"
                }
            }
        ],
        "options": {
            "throwExceptionOnFailure": true
        },
        "blueprint": {}
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|scheme|X| |
|hostname|X| |
|port|X| |
|resourceUri|X|resource URI to be called|
|queryStringParameters| |`name` and `value`|
|headers.CamelHttpMethod|X|HTTP method, can be `GET`, `POST`, `PUT`, `DELETE`, or `PATCH`|
|headers.Content-Type| |HTTP content type, can be `text/plain`, `text/xml`, `application/json`, `application/x-www-form-urlencoded` or `*/*`|
|authentication.type| |authentication type, can be either `Basic` or `NTLM`|
|authentication.Basic.username| |HTTP basic authentication username|
|authentication.Basic.password| |HTTP basic authentication password|
|authentication.NTLM.authUsername| |NTLM authentication username|
|authentication.NTLM.authPassword| |NTLM authentication  password|
|authentication.NTLM.authDomain| |NTLM authentication domain name|
|authentication.NTLM.authHost| |NTLM authentication hostname|
|options.throwExceptionOnFailure| |when `true` an HTTP response code > 299 will throw an error|
|blueprint|X|empty but must be set for configuration on blueprint level|

The configuration above will be
- sending the message body as a `POST` request against `https://target.com:8443/path?param1=hello`
- sending with the content type `application/json`
- authenticating with the user `username` and the password `password`
- throwing an error if the HTTP response code will be greater than 299
