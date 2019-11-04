@echo off

set projectDir=C:\Users\jkovalchik\git\MyAE\MyAverittExpressApplicationWeb
set target=package
set /p target="target: (%target%) "

call set-myae-env.bat

:: Build the maven project
call mvn %target% -DskipTests -Dwar:exploded

:: Return the config files back to what they used to be.
git checkout %configDir%/ApplicationConfiguration.properties
git checkout %configDir%/ApplicationConfiguration-IAAPPS.properties

:: Move generated files into src/main/webapp/WEB-INF
cp -R %projectDir%\target\classes %projectDir%\src\main\webapp\WEB-INF
cp -R %projectDir%\target\MyAverittExpressApplicationWeb-v1.0.1\WEB-INF\lib %projectDir%\src\main\webapp\WEB-INF

:end