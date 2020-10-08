# Consumer File
The File Consumer provides a file polling component. The base directory of the File Consumer must be `/var/casisp/files`. Mounted directories are not supported as the docker container runs in non-privileged mode.

## Configuration example
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
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|directoryName|X|read directory, must begin be a subdirectory under `var/casisp/files`|
|options.include|X|include file pattern (regex)|
|options.readLock| |read lock validation, values can be `none`, `markerFile`, `changed`, `fileLock`, `rename`, `idempotent`, `idempotent-changed`, `idempotent-rename`|
|options.moveFailed| |subdirectory where the file will be moved in case of an error|
|options.delete| |`true`, if the file should be deleted after the file processing|
|options.idempotent| |`true`, if a file with the same name will be read once only|
|options.noop| |`true`, if no operation should be executed after the file processing|
|options.autoCreate| |`true`, if the read directory should be created if not available|
|options.readLockCheckInterval| |check interval (in ms) for the read lock validation|
|exception|X|empty but must be set for exception handling|

The configuration above will be
- consuming all files in the directory `/var/casisp/files/in`
- validating every second the changed file size before reading
- deleting the file after processing
- processing a file with the same name only once
