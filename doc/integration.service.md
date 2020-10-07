# Integration Services

## Configuration

An Integration Service does contain the following base parameters:
````json
{
    "version": "1.0.0",
    "deployDev": true,
    "deployTest": false,
    "deployProd": false,
    "serviceId": "hello",
    "serviceName": "Hello World",
    "process": {
        "processId": "hello"
    },
    "consumer": [],
    "processor": [],
    "producer": []
}
````
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|version| |optional, semantic version of the Integration Service|
|deployDev| |not used in casisp-runtime|
|deployTest| |not used in casisp-runtime|
|deployProd| |not used in casisp-runtime|
|serviceId|X|semantic ID of the Integration Service, must be unique|
|serviceName|X|name of the Integration Service|
|process.processId|X|process ID, semantic container for multiple Integration Services, used for logging purposes|
|consumer[]|X|consumer component|
|processor[]| |processor components|
|producer[]| |producer components|

## Deployment

The Integration Service model can be sent to the deployment API as following (Windows):
````
deploy-service.bat <service.model.json>
````
or (Linux):
````
./deploy-service.sh <service.model.json>
````
The request will be validated against the JSON Schema first before processing and deploying. If the request has been successfully parsed the response looks like:
````json
{
    "responseCode": 200,
    "responseMessage": "Service model '<serviceId>' successfully parsed and deployment initiated."
}
````
Please check the Apache Camel log for the asynchronous deployment success. The Apache Camel log insode the Docker container can be checked either through the `hawtio` UI with
````
https://localhost:8443/hawtio
````
or with the commands
````
docker exec -it casisp /bin/bash
cd /opt/apache-karaf/data/log
cat karaf.log
````

## Component configuration

For the component references please check the following pages:

### Consumer

- [File](consumer.file.md)
- [SFTP](consumer.sftp.md)
- [JMS](consumer.jms.md)
- [Timer](consumer.timer.md)
- [HTTP](consumer.http.md)
- [Direct VM](consumer.directvm.md)
- [Salesforce CDC](consumer.salesforceCdc.md)

### Processors

- [zip/unzip](processor.zipFileDataFormat.md)
- [JSON Dataformat](processor.jsonDataFormat.md)
- [Log](processor.log.md)
- [Convert Body](processor.convertBodyTo.md)
- [Set Body](processor.setBody.md)
- [Set Header](processor.setHeader.md)
- [Set Property](processor.setProperty.md)
- [Enrich from URI](processor.enrich.md)
- [Process](processor.process.md)

### Producers

- [File](producer.file.md)
- [JMS](producer.jms.md)
- [Kafka](producer.kafka.md)
- [CSV Splitter](producer.csvSplitter.md)
- [JSON Array Splitter](producer.jsonArraySplitter.md)
- [JSON Path Splitter](producer.jsonPathSplitter.md)
- [JSON Path Filter](producer.jsonPathFilter.md)
- [Direct VM](producer.directvm.md)
- [Choice](producer.choice.md)
- [Salesforce REST API](producer.salesforceRestApi.md)
- [Salesforce APEX Call](producer.salesforceApexCall.md)
