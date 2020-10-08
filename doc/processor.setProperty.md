# Processor Set Property
The Set Property Processor sets an exchange property. 

## Configuration example
````json
{
    "processorType": "setProperty",
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
- setting the exchange property `message` to a constant value `Hello World!`
