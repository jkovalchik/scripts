@echo off

set deployDir=%CATALINA_HOME%\webapps\ROOT

if exist %deployDir%\webapps\ROOT rm -r %deployDir%\webapps\ROOT

if not exist %deployDir% mklink /D %deployDir% %projectDir%\src\main\webapp