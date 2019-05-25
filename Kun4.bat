@ECHO OFF
SETLOCAL disableDelayedExpansion
SET /P root=Please Enter a Number from 0:

SET "prevTest=none"
SET "prevFile=none"
FOR /f "tokens=1-3 delims=:" %%A IN (
  '"(FOR /r "%root%" %%F IN (*) do @ECHO %%~znxF:%%~fF:)|sort"'
) DO (
  SET "currTest=%%A"
  SET "currFile=%%B:%%C"
  SETLOCAL enableDelayedExpansion
  SET "match="
  If !currTest! equ !prevTest! fc /b "!prevFile!" "!currFile!" >nul && SET match=1
  If defined match (
    ECHO del "!currFile!"
    ENDLOCAL
  ) else (
    ENDLOCAL
    SET "prevTest=%%A"
    SET "prevFile=%%B:%%C"
  )
)

:EOF
