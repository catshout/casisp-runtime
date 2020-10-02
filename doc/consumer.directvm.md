# Consumer Directvm
The Directvm Consumer provides a synchronous input component that can be served from a Directvm producer component. With this can be designed Integration Service chains.

## Configuration example
````json
{
    "consumerType": "directvm",
    "directvm": {
        "someName": "IN"
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|someName|X|input label, it needs to be unique and correspond with the output label from a Directvm producer|

The configuration above will be
- consume input sent to the label `IN`
