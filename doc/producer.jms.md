# Producer JMS
The JMS Producer provides a JMS component. The basic configuration is contained in the file `deploy/isp.activemqConnectionFactory.xml`

## Configuration example
````json
{
    "producerType": "jms",
    "jms": {
        "blueprint": {},
        "type": "queue",
        "destinationName": "OUT"
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|blueprint|X|empty but must be set for blueprint configuration|
|type|X|either `queue` or `topic`|
|destinationName|X|the name of the queue or topic where messages should be sent to|

The configuration above will be
- sending a message to the queue `OUT`
