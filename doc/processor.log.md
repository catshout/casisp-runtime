# Processor Log
The Log Processor creates a log entry.

## Configuration example
````json
{
    "processorType": "log",
    "log": {
        "message": "body: ${in.body}"
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|message|X|log message|

The configuration above will be
- creating a log entry with the body content
