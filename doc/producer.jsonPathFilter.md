# Producer JSON Path Filter
The JSON Path Splitter Filter provides a JSON Path Filter component. It filters a given JSON message body and sends the output to multiple either Direct VM or JMS endpoints.

## Configuration example
````json
{
    "producerType": "jsonPathFilter",
    "jsonPathFilter": {
        "jsonPath": "$.json.path",
        "endpoint": [
            {
                "type": "direct-vm",
                "someName": "jsonFilterOut"
            }
        ],
        "suppressExceptions": true,
        "blueprint": {}
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|jsonPath|X|name of the JSON Path expression|
|endpoint|X|multiple endpoints|
|endpoint.type|X|endpoint type, either `direct-vm` or `jms`|
|endpoint.someName|(X)|name of the `direct-vm` endpoint (label)|
|endpoint.jms.type|(X)|type of the JMS endpoint, either `queue` or `topic`|
|endpoint.jms.destinationName|(X)|name of the JMS endpoint|
|suppressExceptions| |if set to `true` exceptions will be suppressed|
|blueprint|X|empty but must be set for blueprint configuration|

The configuration above will be
- filtering a JSON message by the JSON path `$.json.path`
- sending the output to the `direct-vm` endpoint `jsonFilterOut`
- suppressing exceptions
