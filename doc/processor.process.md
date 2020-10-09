# Processor Process
The Process Processor executes a Java class. 

## Configuration example
````json
{
    "processorType": "process",
    "process": {
        "blueprint": {
            "processPackage": "com.package",
            "processClass": "MyProcessor"
        }
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|blueprint.processPackage|X|name of the process package|
|blueprint.processClass|X|name of the process class|

The configuration above will be
- processing the message body with the class `com.package.MyProcessor`
