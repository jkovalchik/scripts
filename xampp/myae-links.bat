@echo off

set deployDir=%CATALINA_HOME%\webapps\ROOT
set projectDir=C:\Users\jkovalchik\git\MyAE\MyAverittExpressApplicationWeb

echo Creating symbolic links...
mklink /D %deployDir% %projectDir%\src\main\webapp
mklink /D %deployDir%\WEB-INF\classes %projectDir%\target\MyAverittExpressApplicationWeb-v1.0.0\WEB-INF\classes
mklink /D %deployDir%\WEB-INF\lib %projectDir%\target\MyAverittExpressApplicationWeb-v1.0.0\WEB-INF\lib
echo Finished creating symbolic links!