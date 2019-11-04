@echo off

set deployDir=%CATALINA_HOME%\webapps\ROOT
set projectDir=C:\Users\jkovalchik\git\MyAE\MyAverittExpressApplicationWeb

mklink /D %deployDir% %projectDir%\src\main\webapp