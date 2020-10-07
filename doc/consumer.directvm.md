# Consumer Direct VM
The Direct VM Consumer provides a synchronous input component that can be served from a Direct VM Producer component to chain Integration Services.

## Configuration example
````json
{
    "consumerType": "directvm",
    "directvm": {
        "someName": "chainLabel"
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|someName|X|input label, it needs to be unique and correspond with the output label from a Direct VM Producer|

The configuration above will be
- consuming input sent to the label `chainLabel`
