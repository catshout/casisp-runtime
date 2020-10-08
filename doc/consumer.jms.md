# Consumer JMS
The File Consumer provides a JMS component. The file `deploy/isp.activemqConnectionFactory.xml` contains the basic configuration.

## Configuration example
````json
{
    "consumerType": "jms",
    "jms": {
        "type": "queue",
        "destinationName": "IN",
        "blueprint": {}
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|type|X|either `queue` or `topic`|
|destinationName|X|the name of the queue or topic where messages should be consumed from|
|blueprint|X|empty but must be set for blueprint configuration|

The configuration above will be
- consuming messages from the queue `IN`
