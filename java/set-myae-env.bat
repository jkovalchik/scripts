@echo off

set mode=dev
set /p mode="env: (%mode%) "
if [%mode%]==[PROD] (set mode=prod)
if [%mode%]==[Prod] (set mode=prod)
if [%mode%]==[prod] (set mode=prod)
if [%mode%]==[p] (set mode=prod)
if [%mode%]==[P] (set mode=prod)

:: Change environment to either dev or prod
set overrideDir=C:\work\override\config\myae
set devConfigFile=%overrideDir%\ApplicationConfiguration-DevelopmentDBOverride.properties
set destDir=%CATALINA_HOME%\temp\aemain

if [%mode%]==[prod] goto prod

if not exist %destDir% MkDir %destDir%

:dev
    copy %devConfigFile% %destDir%
    goto endProd
:endDev

:prod
    del /Q %destDir%\*.*
:endProd