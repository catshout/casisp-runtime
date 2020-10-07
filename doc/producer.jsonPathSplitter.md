# Producer JSON Path Splitter
The JSON Path Splitter Producer provides a JSON Path Splitter component. It splits a given JSON message body in multiple JSON chunks. The chunks will be sending to multiple either Direct VM or JMS endpoints.

## Configuration example
````json
{
    "producerType": "jsonPathSplitter",
    "jsonPathSplitter": {
        "jsonPath": "$.json.path",
        "endpoint": [
            {
                "type": "direct-vm",
                "someName": "outJsonPath"
            }
        ],
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
|endpoint.someName| |name of the `direct-vm` endpoint (label)|
|endpoint.jms.type|(X)|type of the JMS endpoint, either `queue` or `topic`|
|endpoint.jms.destinationName|(X)|name of the JMS endpoint|
|blueprint|X|empty but must be set for blueprint configuration|

The configuration above will be
- splitting a JSON message to chunks by the JSON path `$.json.path`
- sending every chunk to the `direct-vm` endpoint `jsonPathOut`
