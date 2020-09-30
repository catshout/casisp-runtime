@echo off
if "%1"=="" goto error
curl --insecure --data @%1 --request POST "https://localhost:8443/casisp/deploy/service" --header "Content-Type: application/json" -u admin:passw0rd
goto end
:error
echo usage: deploy-service.bat filename
:end
