# Producer Direct VM
The Direct VM Producer provides a synchronous output component that sends the output to Direct VM Consumer component to chain Integration Services.

## Configuration example
````json
{
    "producerType": "directvm",
    "directvm": {
        "someName": "chainLabel"
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|someName|X|output label, it needs to be unique and correspond with the input label from a Direct VM Consumer|

The configuration above will be
- sending the output to the label `chainLabel`
