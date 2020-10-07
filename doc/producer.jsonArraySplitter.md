# Producer JSON Array Splitter
The JSON Array Splitter Producer provides a JSON Array Splitter component. It splits a given JSON array message body in multiple JSON array chunks. The chunks will be sending to multiple either Direct VM or JMS endpoints.

## Configuration example
````json
{
    "producerType": "jsonArraySplitter",
    "jsonArraySplitter": {
        "arrayName": "array",
        "splitSize": 5,
        "endpoint": [
            {
                "type": "direct-vm",
                "someName": "jsonArrayOut"
            }
        ],
        "blueprint": {},
        "context": {}
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|arrayName|X|name of the JSON array|
|splitSize|X|number of elements per splitted array chunk|
|endpoint|X|multiple endpoints|
|endpoint.type|X|endpoint type, either `direct-vm` or `jms`|
|endpoint.someName| |name of the `direct-vm` endpoint (label)|
|endpoint.jms.type|(X)|type of the JMS endpoint, either `queue` or `topic`|
|endpoint.jms.destinationName|(X)|name of the JMS endpoint|
|blueprint|X|empty but must be set for blueprint configuration|
|context|X|empty but must be set for context configuration|

The configuration above will be
- splitting a JSON array message to array chunks with the size `5`
- sending every chunk to the `direct-vm` endpoint `jsonArrayOut`
