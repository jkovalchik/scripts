@echo off

:: Default to build-war for the ant target
set target=build-war
if not [%1] == [] (set target=%1)

set tomcat=-Dtomcat.dir=%CATALINA_HOME%
set jsch=-lib .\jsch-0.1.53.jar
set maven=-lib .\maven-ant-tasks-2.1.3.jar
set outputWarFile=-Doutput.war.file=cron.war
rem set outputWarDir=-Doutput.war.dir=%CATALINA_HOME%/webapps
set outputWarDir=-Doutput.war.dir=C:\work\xampp\tomcat\webapps
set warArgs=%outputWarDir% %outputWarFile%
set cleanDir=%CATALINA_HOME%/webapps/cron

rm -r %cleanDir%
ant %target% %tomcat% %jsch% %maven% %warArgs%

:end