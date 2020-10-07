@echo off
if "%1"=="" goto error
curl --insecure --data @%1 --request POST "https://localhost:8443/casisp/deploy/api" --header "Content-Type: application/json" -u admin:passw0rd
goto end
:error
echo usage: deploy-api.bat filename
:end
