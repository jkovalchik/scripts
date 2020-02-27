@echo off

set ogDir=%CD%
cd C:\work\scripts\misc\api_key_generator
java APIKeyGenerator
cd %ogDir%