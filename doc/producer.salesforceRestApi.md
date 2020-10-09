# Producer Salesforce REST API
The Salesforce API Producer calls a Salesforce REST API. The response will be sent to multiple either Direct VM or JMS endpoints.

## Configuration example
````json
{
    "producerType": "salesforceRestApi",
    "salesforceRestApi": {
        "operationName": "updateSObject",
        "options": {
            "apiVersion": "48.0",
            "format": "JSON",
            "sObjectName": "name",
            "sObjectId": "id"
        },
        "endpoint": [
            {
                "type": "direct-vm",
                "someName": "outSalesforce"
            }
        ],
        "blueprint": {}
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|operationsName|X|Salesforce operation name|
|options.apiVersion|X|Salesforce API version|
|options.format|X|either `JSON` or `XML`|
|options.sObjectName| |Salesforce `sObjectName`|
|options.sObjectId| |Salesforce `sObjectId`|
|options.sObjectIdName| |Salesforce `sObjectIdName`|
|options.sObjectIdValue| |Salesforce `sObjectIdValue`|
|options.sObjectBlobFieldName| |Salesforce `sObjectBlobFieldName`|
|options.sObjectQuery| |Salesforce `sObjectQuery`|
|options.sObjectSearch| |Salesforce `sObjectSearch`|
|endpoint|X|multiple endpoints|
|endpoint.type|(X)|endpoint type, either `direct-vm` or `jms`|
|endpoint.someName| |name of the `direct-vm` endpoint (label)|
|endpoint.jms.type|(X)|type of the JMS endpoint, either `queue` or `topic`|
|endpoint.jms.destinationName|(X)|name of the JMS endpoint|
|blueprint|X|empty but must be set for blueprint handling|

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
- sending data to a Salesforce REST API in `JSON` format with sObjectName `name` and sObjectId `id`
- based on the API version `48.0`
- sending the response to the `direct-vm` endpoint `outSalesforce`
