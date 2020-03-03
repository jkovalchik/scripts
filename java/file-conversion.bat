@echo off

set user=db2admin
set pass=meowhow9
set key=126f8271d8f5edbff62d1edb40f25b9eb2c1e375
set target=spring-boot:run
set configBranch=develop
set profile=development

set /p target="target: (%target%) "

set /p profile="env: (development) "
if [%profile%]==[PROD] (set profile=production)
if [%profile%]==[Prod] (set profile=production)
if [%profile%]==[prod] (set profile=production)
if [%profile%]==[p] (set profile=production)
if [%profile%]==[P] (set profile=production)

if [%profile%]==[production] (
	set username=webadmin
)
set arguments=-Dapi.key=%key% -Dspring.datasource.username=%user% -Dspring.datasource.password=%pass% -Dspring.cloud.config.label=%configBranch% -Dspring.profiles.active=%profile%

:: does target contain "spring-boot:run"?
if not "x%target:spring-boot:run=%"=="x%target%" (
    set arguments=-Dspring-boot.run.jvmArguments="%arguments%"
)

mvn %target% %arguments%