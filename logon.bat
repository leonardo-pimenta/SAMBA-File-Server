#Mapeamento automático no Windows
# /usr/local/samba/var/locks/sysvol/cccpmm.ad/scripts/logon.bat

echo off
net use /DELETE G:
net use /DELETE Q:
net use /DELETE R:
net use /DELETE Z:


echo "Recuperando compartilhamentos"
net use G: \\cccpmfs\geral  /persistent:yes
net use Q: \\cccpmfs\grupos  /persistent:yes
net use R: \\cccpmfs\restrito  /persistent:yes
net use Z: \\cccpmfs\compartilhamento_arquivos  /persistent:yes
net time \\cccpmfs /set /yes



:: Configure Wallpaper
xcopy "\\1.0.1.1\geral\wallpaper.jpeg" "%USERPROFILE%" /C/Y/D
REG ADD "HKCU\Control Panel\Desktop" /V Wallpaper /T REG_SZ /F /D "%USERPROFILE%\wallpaper.jpeg"
REG ADD "HKCU\Control Panel\Desktop" /V WallpaperStyle /T REG_SZ /F /D 2
REG ADD "HKCU\Control Panel\Desktop" /V TileWallpaper /T REG_SZ /F /D 0
:: Para as alterações entrarem em vigor imediatamente
%SystemRoot%\System32\RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters

C:\WINDOWS\REGEDIT.EXE -s \\1.0.1.1\netlogon\AlteraProxy.reg



if \\cccpmfs\home\%USERNAME% == \\cccpmfs\home\%USERNAME% goto certo
if not \\cccpmfs\home\%USERNAME% == \\cccpmfs\home\%USERNAME% goto fim
:certo
net use H: \\cccpmfs\home\%USERNAME%
goto fim
:fim
