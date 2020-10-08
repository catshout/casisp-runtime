# Producer JMS
The JMS Producer provides a JMS component. The file `deploy/isp.activemqConnectionFactory.xml` contains the basic configuration.

## Configuration example
````json
{
    "producerType": "jms",
    "jms": {
        "type": "queue",
        "destinationName": "OUT",
        "blueprint": {}
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|type|X|either `queue` or `topic`|
|destinationName|X|the name of the queue or topic where messages should be sent to|
|blueprint|X|empty but must be set for blueprint configuration|

The configuration above will be
- sending a message to the queue `OUT`
