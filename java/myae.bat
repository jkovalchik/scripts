@echo off

set ogDir=%CD%
set projectDir=C:\Users\jkovalchik\git\MyAE\MyAverittExpressApplicationWeb
set webapp=%projectDir%\src\main\webapp
set webInf=%webapp%\WEB-INF
set overrideDir=C:\work\override\config\myae
set devConfigFile=%overrideDir%\ApplicationConfiguration-DevelopmentDBOverride.properties
set tempDir=%CATALINA_HOME%\temp\aemain

cd %projectDir%

set target=prepare-package
set /p target="target: (%target%) "

call set-env.bat

:: Build the maven project
call mvn %target% -DskipTests -Dcatalina.base=%CATALINA_HOME%

:: Move generated files into src/main/webapp/WEB-INF
call project-version.bat
cp -r %projectDir%\target\classes %webInf%
cp -r %projectDir%\target\MyAverittExpressApplicationWeb-%version%\WEB-INF\lib %webInf%

call set-links.bat

call tomcat-start.bat

cd %ogDir%