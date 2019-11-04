@echo off

set projectDir=C:\Users\jkovalchik\git\AECronService\AverittExpressCronWeb
set target=package
set /p target="target: (%target%) "

call set-cron-env.bat

:: Build the maven project
call mvn %target% -DskipTests -Dcatalina.base=%CATALINA_HOME%

:: Return the config files back to what they used to be.
REM git checkout %configDir%/ApplicationConfiguration.properties
REM git checkout %configDir%/ApplicationConfiguration-DevelopmentDBOverride.properties

:: Move generated files into src/main/webapp/WEB-INF
cp -R %projectDir%\target\classes %projectDir%\src\main\webapp\WEB-INF
cp -R %projectDir%\target\AverittExpressCronWeb-v1.1.3\WEB-INF\lib %projectDir%\src\main\webapp\WEB-INF
