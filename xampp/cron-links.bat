@echo off

set deployDir=%CATALINA_HOME%\webapps\cron
set projectDir=C:\Users\jkovalchik\git\AECronService\AverittExpressCronWeb

mklink /D %deployDir% %projectDir%\src\main\webapp