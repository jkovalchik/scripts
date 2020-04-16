@echo off

:: keytool -genkey -v -keystore <keystoreName>.keystore -alias <Keystore AliasName> -keyalg <Key algorithm> -keysize <Key size> -validity <Key Validity in Days>
keytool -genkey -v -keystore drive.keystore -alias drivekeystore -keyalg RSA -keysize 2048 -validity 10000