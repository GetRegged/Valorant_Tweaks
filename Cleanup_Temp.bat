ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset
netsh int tcp reset
netsh winsock reset
netsh branchcache reset
netsh http flush logbuffer

del /s /f /q "%AppData%\Discord\Cache"
del /s /f /q "%AppData%\Discord\Code Cache"
del /s /f /q "%AppData%\Local\Microsoft\Windows\INetCache"
del /s /f /q "%AppData%\Local\Microsoft\Windows\INetCookies"
del /s /f /q "%LocalAppData%\Microsoft\Windows\Explorer\*.db"
del /s /f /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db"
del /s /f /q "%LocalAppData%\Microsoft\Windows\WebCache"
del /s /f /q "%ProgramData%\USOPrivate\UpdateStore"
del /s /f /q "%ProgramData%\USOShared\Logs"
del /s /f /q "%systemdrive%\$Recycle.Bin\*.*"
del /s /f /q "%temp%"
del /s /f /q "%windir%\Installer\$PatchCache$"
del /s /f /q "%windir%\Logs"
del /s /f /q "%windir%\Prefetch"
del /s /f /q "%windir%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization"
del /s /f /q "%windir%\SoftwareDistribution\Download"
del /s /f /q "%windir%\System32\SleepStudy"
del /s /f /q "%windir%\prefetch\*.*"
del /s /f /q "%windir%\temp"
rd /s /q "%SystemDrive%\$GetCurrent"
rd /s /q "%SystemDrive%\$SysReset"
rd /s /q "%SystemDrive%\$WinREAgent"
rd /s /q "%SystemDrive%\$Windows.~BT"
rd /s /q "%SystemDrive%\$Windows.~WS"
rd /s /q "%SystemDrive%\OneDriveTemp"
rd /s /q "%SystemDrive%\System Volume Information"

auditpol /set /subcategory:"Filtering Platform Connection" /success:disable /failure:enable
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G") >nul 2>nul

FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")

exit
