# Consumer SFTP
The File Consumer provides a SFTP polling component.

## Configuration example
````json
{
    "consumerType": "sftp",
    "sftp": {
        "host": "host",
        "port": 22,
        "directoryName": "infiles",
        "options": {
            "include": ".*",
            "delete": true,
            "idempotent": true,
            "autoCreate": false,
            "binary": true,
            "disconnect": false,
            "readLock": "changed",
            "moveFailed": "error",
            "maximumReconnectAttempts": 10,
            "delay": 1000,
            "localWorkDirectory": "/var/casisp/files/sftpwork",
            "knownHostsFile": "",
            "username": "username",
            "password": "passw0rd",
            "privateKeyFile": "",
            "privateKeyPassphrase": ""
        }
    }
}
````
## Configuration parameters
|Parameter|Mandatory|Description|
|:---|:---:|:---|
|host|X|SFTP host|
|port| |SFTP port (standard port is 22)|
|directoryName|X|SFTP directory|
|options.include|X|include file pattern (regex)|
|options.delete| |`true`, if the file should be deleted after the file processing|
|options.idempotent| |`true`, if a file with the same name will be read once only|
|options.autoCreate| |`true`, if the read directory should be created if not available|
|options.binary| |`true`, if the transfer happens in binary mode|
|options.disconnect| |`true`, if disconnect after file processing|
|options.readLock| |read lock validation, values can be `none`, `markerFile`, `changed`, `fileLock`, `rename`, `idempotent`, `idempotent-changed`, `idempotent-rename`|
|options.moveFailed| |subdirectory where the file will be moved in case of an error|
|options.maximumReconnectAttempts| |number of reconnect attempts|
|options.delay| |milliseconds before the next poll|
|options.localWorkDirectory| |local work directory to store file instead of memory|
|options.username| |username for SFTP connection|
|options.password| |password for SFTP connection|
|options.privateKeyFile| |key file for SFTP connection|
|options.privateKeyPassphrase| |key passphrase for SFTP connection|

The configuration above will be
- consuming all files from the host `host:22/infiles` in binary mode
- trying 10 times before throwing an error
- validating every second the changed file size before reading
- deleting the file after processing
- processing a file with the same name only once
- keeping the connection open
- using the local working directory `/var/casisp/files/sftpwork`
- using the credentials `username` and `passw0rd`
