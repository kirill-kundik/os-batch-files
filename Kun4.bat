@ECHO OFF

ECHO Set path to test folder, which will be choosen for file equality checking

:searchFolder
SET /p root=Enter the path:
IF EXIST %root% (
  GOTO :inspectMatch
  ) ELSE (
    ECHO There arent any directories with such name - ERROR
    GOTO :searchFolder
)

:inspectMatch
FOR %%n IN (%root%\*) DO (
  ECHO Same files to the %%n: >> List.txt
  :: ECHO %%n
  FOR /r %root%\ %%i IN (*) DO (
	IF NOT %%n==%%i (
      fc /b %%n %%i >NUL && ECHO File: %%~nxi  Path: %%~dpi  >> List.txt
    )
  )
 :: ECHO No more equal files >> List.txt
 ECHO. >> List.txt
)

GOTO :EOF

:EOF
EXIT
