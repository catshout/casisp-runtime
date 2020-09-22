#Consumer File
The HTTP Consumer provides an HTTP endpoint with an optional basic authentication. It runs on the same port as the HTTP server, basically configured with port 8443.

##Configuration example
````json
{
    "consumerType": "file",
    "file": {
        "directoryName": "/var/casisp/files/in",
        "options": {
            "include": ".*",
            "readLock": "changed",
            "moveFailed": "error",
            "delete": true,
            "idempotent": true,
            "noop": false,
            "autoCreate": false,
            "readLockCheckInterval": 1000
        },
        "exception": {}
    }
}
````
##Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|directoryName|X|read directory, must begin be a subdirectory under `var/casisp/files`|
|options/include| |include file pattern (regex)|
|options/readLock| |read lock validation, values can be `none`, `markerFile`, `changed`, `fileLock`, `rename`, `idempotent`, `idempotent-changed`, `idempotent-rename`|
|options/moveFailed| |subdirectory where the file will be moved in case of an error|
|options/delete| |true, if the file should be deleted after the file processing|
|options/idempotent| |true, if a file with the same name will be read once only|
|options/noop| |true, if no operation should be executed after the file processing|
|options/autoCreate| |true, if the read directory should be created if not available|
|options/readLockCheckInterval| |check interval (in ms) for the read lock validation|
|exception|X|empty but must be set for exception handling|

The configuration above will be
- consuming all file in the directory `/var/casisp/files/in`
- validating every second the changed file size before reading
- deleting the file after processing
- processing a file with the same name only once