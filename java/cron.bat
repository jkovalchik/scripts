@echo off

call project-version.bat

set projectDir=C:\Users\jkovalchik\git\AECronService\AverittExpressCronWeb
set target=package
set /p target="target: (%target%) "
set /p version="version: (%version%) "

call set-cron-env.bat

:: Build the maven project
call mvn %target% -DskipTests -Dcatalina.base=%CATALINA_HOME%

:: Move generated files into src/main/webapp/WEB-INF
cp -R %projectDir%\target\classes %projectDir%\src\main\webapp\WEB-INF
cp -R %projectDir%\target\AverittExpressCronWeb-%version%\WEB-INF\lib %projectDir%\src\main\webapp\WEB-INF

call set-links.bat