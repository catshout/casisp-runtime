# Processor SetBody
The SetBody Processor sets the message body. 

## Configuration example
````json
{
    "processorType": "setBody",
    "setBody": {
        "language": "constant",
        "expression": "Hello World!"
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|language|X|language, values can be `constant`, `simple`, `jsonpath`, `xpath` or `groovy`|
|resultType| |result type, only for `simple` expression|
|expression|X|expression|

The configuration above will be
- setting the message body with a constant value `Hello World!`
