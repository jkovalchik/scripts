@echo off

set cmd=mvn -q -Dexec.executable=printf -Dexec.args=${project.version} --non-recursive exec:exec

for /f %%i in ('%%cmd%%') do set version=%%i