# Processor Set Header
The Set Header Processor sets a message header. 

## Configuration example
````json
{
    "processorType": "setHeader",
    "setHeader": {
        "language": "constant",
        "name": "message",
        "expression": "Hello World!"
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|language|X|language, values can be `constant`, `simple`, `jsonpath`, `xpath` or `groovy`|
|name|X|name of the message header|
|resultType| |result type, only for `simple` expression|
|expression|X|expression|

The configuration above will be
- setting the message header `message` with a constant value `Hello World!`
