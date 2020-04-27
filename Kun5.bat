@ECHO OFF 

:searchFolder
IF EXIST %1 (
  GOTO :inspectMatch
  ) ELSE (
    ECHO Directory %1 doesn't exist! Ending...
    GOTO :EOF
)

:inspectMatch
ECHO Emptry directories, which parent directory is %1: >> %1\List.txt
ECHO. >> %1\List.txt
FOR /D %%n IN (%1\*) DO (
  DIR /B /A "%%n\*" | >NUL findstr "^" || (ECHO %%n >> %1\List.txt)
)
ECHO. >> %1\List.txt
GOTO EOF

:EOF
