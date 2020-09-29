# Consumer JMS
The File Consumer provides a JMS component. The basic basic configuration is contained in the file `deploy/isp.activemqConnectionFactory.xml`

## Configuration example
````json
{
    "consumerType": "jms",
    "jms": {
        "blueprint": {},
        "type": "queue",
        "destinationName": "IN"
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|blueprint|X|empty but must be set for blueprint configuration|
|type|X|either `queue` or `topic`|
|destinationName|X|the name of the queue or topic where messages should be consumed from|

The configuration above will be
- consuming messages from the queue `IN`
