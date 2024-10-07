ipconfig /flushdns
del "%AppData%\Discord\Cache\." /s /f /q
del "%AppData%\Discord\Code Cache\." /s /f /q
del "%AppData%\Local\Microsoft\Windows\INetCookies\." /s /f /q
del "%LocalAppData%\Microsoft\Windows\Explorer\*.db" /s /f /q
del "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db" /s /f /q
del "%LocalAppData%\Microsoft\Windows\INetCache\." /s /f /q
del "%ProgramData%\USOPrivate\UpdateStore" /s /f /q
del "%ProgramData%\USOShared\Logs" /s /f /q
del "%SystemRoot%\Logs\CBS\CBS.log" /f /q
del "%SystemRoot%\Logs\DISM\DISM.log" /f /q
del "%WINDIR%\Installer\$PatchCache$" /s /f /q
del "%WINDIR%\Logs" /s /f /q
del "%systemdrive%\$Recycle.Bin\*.*" /s /f /q
del "%systemdrive%\*._mp" /s /f /q
del "%systemdrive%\*.chk" /s /f /q
del "%systemdrive%\*.gid" /s /f /q
del "%systemdrive%\*.log" /s /f /q
del "%systemdrive%\*.old" /s /f /q
del "%systemdrive%\*.tmp" /s /f /q
del "%systemdrive%\recycled\*.*" /s /f /q
del "%temp%" /s /f /q
del "%temp%." /s /f /q
del "%windir%\*.bak" /s /f /q
del "%windir%\prefetch\*.*" /s /f /q
del "C:\Windows\System32\SleepStudy" /s /f /q
del "c:\WINDOWS\Prefetch" /s /f /q
del "c:\windows\temp." /s /f /q
deltree "c:\windows\cookies" /y
deltree "c:\windows\ff*.tmp" /y
deltree "c:\windows\history" /y
deltree "c:\windows\recent" /y
deltree "c:\windows\spool\printers" /y
deltree "c:\windows\temp" /y
deltree "c:\windows\tempor~1" /y
deltree "c:\windows\tmp" /y
rd /s /q %LocalAppData%\Temp
rd /s /q %LocalAppData%\Temp\mozilla-temp-files
rd /s /q %WINDIR%\SoftwareDistribution\Download\
rmdir /S /Q "%AppData%\Discord\Cache"
rmdir /S /Q "%AppData%\Discord\Code Cache"
rmdir /S /Q "%AppData%\Local\Microsoft\Windows\INetCache\"
rmdir /S /Q "%AppData%\Local\Microsoft\Windows\INetCookies"
rmdir /S /Q "%AppData%\Local\Temp\"
rmdir /S /Q "%LocalAppData%\Microsoft\Windows\WebCache"
rmdir /S /Q "%SystemDrive%\$GetCurrent"
rmdir /S /Q "%SystemDrive%\$SysReset"
rmdir /S /Q "%SystemDrive%\$WinREAgent"
rmdir /S /Q "%SystemDrive%\$Windows.~BT"
rmdir /S /Q "%SystemDrive%\$Windows.~WS"
rmdir /S /Q "%SystemDrive%\OneDriveTemp"
rmdir /S /Q "%WINDIR%\ServiceProfiles\NetworkService\AppData\Local\Microsoft\Windows\DeliveryOptimization"
rmdir /s /q "%SystemRoot%\System32\SleepStudy >nul 2>&1"
rmdir /s /q "%SystemRoot%\System32\SleepStudy"

auditpol /set /subcategory:"Filtering Platform Connection" /success:disable /failure:enable
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G") >nul 2>nul

FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
IF (%adminTest%)==(Access) goto noAdmin
for /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")

exit
