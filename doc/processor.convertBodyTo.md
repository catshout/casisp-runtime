# Processor ConvertBodyTo
The ConvertBodyTo Processor converts the message body to another format. 

## Configuration example
````json
{
    "processorType": "convertBodyTo",
    "convertBodyTo": {
        "type": "java.lang.String",
        "charset": "UTF-8"
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|type|X|Java class for the conversion|
|charset| |charset for the conversion|

The configuration above will be
- converting the message body to Java String with the charset UTF-8
