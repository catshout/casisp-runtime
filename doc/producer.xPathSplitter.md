# Producer XPath Splitter
The XPath Splitter Producer provides a XPath Splitter component. It splits a given XML message body in multiple XML chunks. The chunks will be sending to multiple either Direct VM or JMS endpoints.

## Configuration example
````json
{
    "producerType": "xPathSplitter",
    "xPathSplitter": {
        "xPath": "/x/path",
        "endpoint": [
            {
                "type": "direct-vm",
                "someName": "outXPath"
            }
        ],
        "blueprint": {}
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|xPath|X|the XPath expression|
|endpoint|X|multiple endpoints|
|endpoint.type|X|endpoint type, either `direct-vm` or `jms`|
|endpoint.someName|(X)|name of the `direct-vm` endpoint (label)|
|endpoint.jms.type|(X)|type of the JMS endpoint, either `queue` or `topic`|
|endpoint.jms.destinationName|(X)|name of the JMS endpoint|
|blueprint|X|empty but must be set for blueprint configuration|

The configuration above will be
- splitting a XML message to chunks by the XPath `/x/path`
- sending every chunk to the `direct-vm` endpoint `outXPath`
