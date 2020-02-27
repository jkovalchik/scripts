@echo off

set project=example-api
set /p project="project: (%project%) "

set namespace=%project%
set /p namespace="namespace: (%namespace%) "

set password=meowhow9
set /p password="password: (%password%) "

kubectl -n %namespace% create secret generic %project%-secret --from-literal=datasource_password=%password% -o yaml --dry-run | kubeseal > resources/namespaces/%project%/%project%.sealed-secret.json && json-to-yaml.exe