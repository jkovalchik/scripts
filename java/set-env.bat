@echo off

set mode=dev
set /p mode="env: (%mode%) "
if [%mode%]==[PROD] (set mode=prod)
if [%mode%]==[Prod] (set mode=prod)
if [%mode%]==[prod] (set mode=prod)
if [%mode%]==[p] (set mode=prod)
if [%mode%]==[P] (set mode=prod)

if [%mode%]==[prod] goto prod

if not exist %tempDir% MkDir %tempDir%

:dev
    copy %devConfigFile% %tempDir%
    goto endProd
:endDev

:prod
    del /Q %tempDir%\*.*
:endProd