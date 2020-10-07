# Processor zip/unzip
The zip/unzip Processor provides a component to zip or unzip the message content. 

## Configuration example
````json
{
    "processorType": "zipFileDataFormat",
    "zipFileDataFormat": {
        "marshal": "unmarshal"
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|marshal|X|configures zip `marshal` or unzip `unmarshal`|

The configuration above will be
- unzipping the message body
