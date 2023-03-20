@echo off
rem Configurar proxy

reg add "hkey_current_user\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /d proxy-1dn.mb:6060 /f
reg add "hkey_current_user\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /d 1 /f
reg add "hkey_current_user\Software\Microsoft\Windows\currentVersion\Internet Settings" /v ProxyOverride /d "*mb;*mar.mil.br;www.cccpm.mb;<local>" /f
echo.
echo Servidor Proxy Padrão definido