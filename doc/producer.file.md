# Producer File
The File Producer writes a file to a specified directory.

## Configuration example
````json
{
    "producerType": "file",
    "file": {
        "directoryName": "/var/casisp/files/out",
        "options": {
            "fileName": "file.csv"
        }
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|directoryName|X|write directory, must begin be a subdirectory under `var/casisp/files`|
|options.fileName| |fileName, supports simple language|

The configuration above will be
- writing a file `file.csv` to the directory `/var/casisp/files/out`
