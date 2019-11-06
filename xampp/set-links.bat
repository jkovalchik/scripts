@echo off

set deployDir=%CATALINA_HOME%\webapps\ROOT

if exist %deployDir% (
    rm -r %deployDir%
)

mklink /D %deployDir% %webapp%