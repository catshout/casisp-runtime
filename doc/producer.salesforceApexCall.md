# Producer Salesforce APEX Call
The Salesforce APEX Call Producer calls a Salesforce APEX interface. The response will be sent to multiple either Direct VM or JMS endpoints.

## Configuration example
````json
{
    "producerType": "salesforceApexCall",
    "salesforceApexCall": {
        "url": "http://salesforce/url",
        "method": "POST",
        "apiVersion": "48.0",
        "blueprint": {
            "queryParams": [
                {
                    "parameter": "param1",
                    "value": "value1"
                }
            ]
        }
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|url|X|Salesforce URL|
|method|X|HTTP method, could be either `GET`, `POST`, `PUT`, `DELETE`, `HEAD`, `OPTIONS`|
|apiVersion|X|Salesforce API version|
|blueprint|X|must be set for blueprint handling|
|blueprint.queryParams| |key/value pairs for query parameters|

The file `etc/casisp.cfg` must contain the values for the Salesforce access as following

````
################################################################################
#
# salesforce environment parameters
#
################################################################################

salesforce.loginUrl=
salesforce.clientId=
salesforce.clientSecret=
salesforce.userName=
salesforce.password=
````

The configuration above will be
- sending the message body as a `POST` request against a Salesforce APEX on `http://salesforce/url?param1=value1`
- based on the API version `48.0`
