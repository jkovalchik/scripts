@echo off

set port=9090
set root="web"
if not [%1] == [] (set root=%1)
if not [%2] == [] (set port=%2)

php app/console server:run localhost:%port% --docroot=%root%