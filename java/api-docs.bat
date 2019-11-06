@echo off

set mode=production
set username=db2admin
set password=meowhow9
set target=package
set configBranch=develop

set /p target="target: (%target%) "

set /p testClass="test class: (all) "
if not [%testClass%]==[] (
    set testClass=-Dtest=%testClass% test
)

set /p mode="env: (%mode%) "
if [%mode%]==[DEV] (set mode=development)
if [%mode%]==[Dev] (set mode=development)
if [%mode%]==[dev] (set mode=development)
if [%mode%]==[D] (set mode=development)
if [%mode%]==[d] (set mode=development)

if [%mode%]==[production] (
	set username=webadmin
)

set arguments=-Dspring.datasource.username=%username% -Dspring.datasource.password=%password% -Dspring.cloud.config.label=%configBranch% -Dspring.profiles.active=%mode% -Dapi.key=1234567

call mvn %target% %arguments% %testClass%