# Producer CSV Splitter
The CSV Splitter Producer provides a CSV Splitter component. It splits a given CSV message body in multiple chunks, every chunk contains the CSV header. The chunks will be sending to multiple either Direct VM or JMS endpoints.

## Configuration example
````json
{
    "producerType": "csvSplitter",
    "csvSplitter": {
        "splitSize": 5,
        "endpoint": [
            {
                "type": "direct-vm",
                "someName": "csvOut"
            },
            {
                "type": "jms",
                "jms": {
                    "type": "queue",
                    "destinationName": "CSVOUT"
                }
            }
        ],
        "blueprint": {}
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|splitSize|X|number of lines per splitted chunk|
|endpoint|X|multiple endpoints|
|endpoint.type|X|endpoint type, either `direct-vm` or `jms`|
|endpoint.someName| |name of the `direct-vm` endpoint (label)|
|endpoint.jms.type|(X)|type of the JMS endpoint, either `queue` or `topic`|
|endpoint.jms.destinationName|(X)|name of the JMS endpoint|
|blueprint|X|empty but must be set for blueprint configuration|

The configuration above will be
- splitting a CSV message to chunks with the size `5`
- sending every chunk to the `direct-vm` endpoint `csvOut`
- sending every chunk to the queue `CSVOUT`
