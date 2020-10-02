# Consumer Timer
The Timer Consumer provides a timer component.

## Configuration example
````json
{
    "consumerType": "timer",
    "timer": {
        "options": {
            "delay": 1000,
            "period": 1000,
            "repeatCount": 0
        }
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|delay| |time (in milliseconds) before the route starts the first time|
|period|X|period (in milliseconds) between route executions|
|repeatCount|X|number of route executions (0 - infinite)|

The configuration above will be
- start the route after 1 sec every second for an infinite time
