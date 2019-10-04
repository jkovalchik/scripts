@echo off

set configDir=C:\Users\jkovalchik\git\MyAE\MyAverittExpressApplicationWeb\src\main\resources
set mode=dev
set /p mode="env: (dev) "
if [%mode%]==[PROD] (set mode=prod)
if [%mode%]==[Prod] (set mode=prod)
if [%mode%]==[prod] (set mode=prod)
if [%mode%]==[p] (set mode=prod)
if [%mode%]==[P] (set mode=prod)

:: Change environment to either dev or prod
set appConfigFile=%configDir%/ApplicationConfiguration.properties
set iaappsFile=%configDir%/ApplicationConfiguration-IAAPPS.properties
if [%mode%]==[prod] goto prod
:dev
    set txnDataSource=java:comp/env/jdbc/TxnDataSourceDev
    set dataSource=java:comp/env/jdbc/Development
    set sqlDataSource=java:comp/env/jdbc/Development-SQL
    set intsvcSchemasDataSource=java:comp/env/jdbc/IntsvcSchemasDS-Dev

    set appsSchemeDomain=https://dev-apps.insideaveritt.com
    set apiSchemeDomain=https://dev-api.insideaveritt.com

    goto endProd
:endDev

:prod
    set txnDataSource=java:comp/env/jdbc/TxnDataSource
    set dataSource=java:comp/env/jdbc/Production
    set sqlDataSource=java:comp/env/jdbc/Production-SQL
    set intsvcSchemasDataSource=java:comp/env/jdbc/IntsvcSchemasDS-Prod

    set appsSchemeDomain=https://apps.insideaveritt.com
    set apiSchemeDomain=https://api.averittexpress.com
:endProd

set appsSchemeCommand=powershell -Command "(gc %iaappsFile%) -replace '^APPS_SCHEME_DOMAIN = .*', 'APPS_SCHEME_DOMAIN = %appsSchemeDomain%' | Set-Content %iaappsFile%"
set apiSchemeCommand=powershell -Command "(gc %iaappsFile%) -replace '^API_SCHEME_DOMAIN = .*', 'API_SCHEME_DOMAIN = %apiSchemeDomain%' | Set-Content %iaappsFile%"
set changeIaappsFileCommand=%appsSchemeCommand% && %apiSchemeCommand%

set txnDataSourceCommand=powershell -Command "(gc %appConfigFile%) -replace '^txnDataSource=.*', 'txnDataSource=%txnDataSource%' | Set-Content %appConfigFile%"
set dataSourceCommand=powershell -Command "(gc %appConfigFile%) -replace '^dataSource=.*', 'dataSource=%dataSource%' | Set-Content %appConfigFile%"
set sqlDataSourceCommand=powershell -Command "(gc %appConfigFile%) -replace '^sqlDataSource=.*', 'sqlDataSource=%sqlDataSource%' | Set-Content %appConfigFile%"
set intsvcSchemasDataSourceCommand=powershell -Command "(gc %appConfigFile%) -replace '^intsvcSchemasDataSource=.*', 'intsvcSchemasDataSource=%intsvcSchemasDataSource%' | Set-Content %appConfigFile%"
set changeAppConfigFileCommand=%txnDataSourceCommand% && %dataSourceCommand% && %sqlDataSourceCommand% && %intsvcSchemasDataSourceCommand%

set changeFilesCommand=%changeAppConfigFileCommand% && %changeIaappsFileCommand%
%changeFilesCommand%