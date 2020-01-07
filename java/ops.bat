@echo off

set ogDir=%CD%
set projectDir=C:\Users\jkovalchik\git\Operations\Operations
set webapp=%projectDir%\src\main\webapp
set webInf=%webapp%\WEB-INF
set overrideDir=C:\work\override\config\ops
set devConfigFile=%overrideDir%\ApplicationConfiguration-DevelopmentDBOverride.properties
set tempDir=%CATALINA_HOME%\temp\ops

cd %projectDir%

set target=package
set /p target="target: (%target%) "

call set-env.bat

:: Build the maven project
call mvn %target% -DskipTests -Dcatalina.base=%CATALINA_HOME% -Djava.security.auth.login.config=%CATALINA_HOME%\temp\ops\jaas.conf

:: Move generated files into src/main/webapp/WEB-INF
call project-version.bat
cp -r %projectDir%\target\classes %webInf%
cp -r %projectDir%\target\operations-%version%\WEB-INF\lib %webInf%

call set-links.bat

call tomcat-start.bat

cd %ogDir%