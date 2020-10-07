# Producer Kafka
The Kafka Producer provides a Kafka component.

## Configuration example
````json
{
    "producerType": "kafka",
    "kafka": {
        "topic": "topic",
        "headers": {
            "kafka_KEY": "key"
        },
        "options": {
            "brokers": "localhost:9092"
        }
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|topic|X|Kafka topic where to write to|
|headers.kafka_KEY|X|key of the message|
|options.brokers|X|the list of Kafka brokers, separated with `,`|

The configuration above will be
- sending a message with the key `key` to the topic `topic` at the Kafka broker `localhost:9092`
