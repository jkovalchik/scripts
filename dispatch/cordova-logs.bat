@echo off

adb -d logcat CORDOVA_PLUGIN_OMNITRACS:I chromium:I *:S
