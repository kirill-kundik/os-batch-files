@ECHO OFF

ECHO Set path to test folder, which will be choosen for file equality checking

:folder
SET /p root=Enter the path:
IF EXIST %root% (
  GOTO :findMatch
  )
  ELSE
  (
    ECHO There arent any directories with such name - ERROR
    GOTO :folder
    )

:findMatch
FOR %%n IN (%root%\*) DO (
  ECHO Files that are the same as %%n: >> List.txt
  :: ECHO %%n
  FOR /r %root%\ %%i IN (*) DO (
    IF NOT %%n==%%i (
      fc /b %%n %%i >NUL && ECHO File: %%i >> List.txt
      )
      )
      :: ECHO No more equal files >> List.txt
      ECHO. >> List.txt
      )

GOTO :EOF

:EOF
EXIT
