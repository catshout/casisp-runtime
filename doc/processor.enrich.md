# Processor Enrich from URI
The Enrich from URI Processor enriches the message body with external content from an URI. The aggregation strategy can be defined to combine the existing message body with the content from the enrich URI. 

## Configuration example
````json
{
    "processorType": "enrich",
    "enrich": {
        "uri": "http://enrich.com",
        "blueprint": {
            "enrichPackage": "com.package",
            "enrichClass": "MyAggregation"
        }
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|uri|X|uri for the endpoint where the enrich content will be read from|
|blueprint.enrichPackage|(X)|name of the aggregation package|
|blueprint.enrichClass|(X)|name of the aggregation class|

The configuration above will be
- enriching the message body with the content from the URI `http://enrich.com` and aggregates it based on the class `com.package.MyAggregation`
