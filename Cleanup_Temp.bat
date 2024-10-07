ipconfig /flushdns
ipconfig /release
ipconfig /renew
netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset
netsh int tcp reset
netsh winsock reset
netsh advfirewall reset
netsh branchcache reset
netsh http flush logbuffer
del /f /q "%SystemRoot%\Logs\CBS\CBS.log"
del /f /q "%SystemRoot%\Logs\DISM\DISM.log"
del /s /f /q "%AppData%\Discord\Cache"
del /s /f /q "%AppData%\Discord\Code Cache"
del /s /f /q "%AppData%\Local\Microsoft\Windows\INetCookies"
del /s /f /q "%LocalAppData%\Microsoft\Windows\Explorer\*.db"
del /s /f /q "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db"
del /s /f /q "%ProgramData%\USOPrivate\UpdateStore"
del /s /f /q "%ProgramData%\USOShared\Logs"
del /s /f /q "%SystemRoot%\Prefetch"
del /s /f /q "%SystemRoot%\temp"
del /s /f /q "%systemdrive%\$Recycle.Bin\*.*"
del /s /f /q "%systemdrive%\recycled\*.*"
del /s /f /q "%temp%."
del /s /f /q "%windir%\Installer\$PatchCache$"
del /s /f /q "%windir%\Logs"
del /s /f /q "%windir%\prefetch\*.*"
rd /s /q "%AppData%\Discord\Cache"
rd /s /q "%AppData%\Discord\Code Cache"
rd /s /q "%AppData%\Local\Microsoft\Windows\INetCache"
rd /s /q "%AppData%\Local\Microsoft\Windows\INetCookies"
rd /s /q "%AppData%\Local\Temp\"
rd /s /q "%LocalAppData%\Microsoft\Windows\WebCache"
rd /s /q "%LocalAppData%\Temp"
rd /s /q "%SystemDrive%\$GetCurrent"
rd /s /q "%SystemDrive%\$SysReset"
rd /s /q "%SystemDrive%\$WinREAgent"
rd /s /q "%SystemDrive%\$Windows.~BT"
rd /s /q "%SystemDrive%\$Windows.~WS"
rd /s /q "%SystemDrive%\OneDriveTemp"
rd /s /q "%SystemRoot%\System32\SleepStudy"
rd /s /q "%windir%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization"
rd /s /q "%windir%\SoftwareDistribution\Download"

auditpol /set /subcategory:"Filtering Platform Connection" /success:disable /failure:enable
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G") >nul 2>nul

FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")

exit
