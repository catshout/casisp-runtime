# Producer Choice
The Choice Producer provides the option to select different outputs based on conditions. The output will be sending to multiple either Direct VM or JMS endpoints for a condition or (optional) to multiple either Direct VM or JMS endpoints when no conditions match.

## Configuration example
````json
{
    "producerType": "choice",
    "choice": {
        "when": [
            {
                "expression": "${header.key1} == 'value1'",
                "endpoint": [
                    {
                        "type": "direct-vm",
                        "someName": "outWhen1"
                    }
                ]
            }
        ],
        "otherwise": [
            {
                "type": "direct-vm",
                "someName": "outOtherwise"
            }
        ],
        "blueprint": {}
    }
}
````
# Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|when|X|evaluation(s)|
|when.expression|X|evaluation expression (simple language)|
|endpoint|X|multiple endpoints|
|endpoint.type|(X)|endpoint type, either `direct-vm` or `jms`|
|endpoint.someName| |name of the `direct-vm` endpoint (label)|
|endpoint.jms.type|(X)|type of the JMS endpoint, either `queue` or `topic`|
|endpoint.jms.destinationName|(X)|name of the JMS endpoint|
|otherwise| |multiple endpoints|
|otherwise.type|(X)|endpoint type, either `direct-vm` or `jms`|
|otherwise.someName| |name of the `direct-vm` endpoint (label)|
|otherwise.jms.type|(X)|type of the JMS endpoint, either `queue` or `topic`|
|otherwise.jms.destinationName|(X)|name of the JMS endpoint|
|blueprint|X|empty but must be set for blueprint configuration|

The configuration above will be
- evaluating the expression `${header.key1} == 'value1'` and if true send the output to the `direct-vm` endpoint `outWhen1`
- sending otherwise the output to the `direct-vm` endpoint `outOtherwise` 
