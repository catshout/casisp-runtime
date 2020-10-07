# Processor JSON Dataformat
The JSON Dataformat Processor provides a component to marshal or unmarshal the message content to or from JSON.

## Configuration example
````json
{
    "processorType": "jsonDataFormat",
    "jsonDataFormat": {
        "marshal": "marshal"
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|marshal|X|configures `marshal` to or `unmarshal` from JSON|

The configuration above will be
- marshaling the message body to JSON
