@ECHO OFF
:START
SET Var=0

SET /P UserInput=Please Enter a Number from 0 to 86400:
SET /A Var="%UserInput%"*1

:: Checking if user entered a number
If %Var%==%UserInput% (
  :: ECHO You entered the number %Var%
  ) else (
  ECHO Your input "%UserInput%" is not a number
  GOTO START
  )

:: Checking if number is in range 0 .. 86400

If %Var% GEQ 86400 (
  ECHO Your number %Var% is not in range 0 .. 86400
  GOTO START
  )
If %Var% LSS 0 (
  ECHO Your number %Var% is not in range 0 .. 86400
  GOTO START
  )

:: Calculating hours, minutes and seconds
:: first variant
REM echo Number of seconds:
REM echo %Var%
REM echo Number of minutes:
REM set /a res = %Var%/60
REM echo %res%
REM echo Number of hours:
REM set /a res = %Var%/3600
REM echo %res%

SET /A hours = %Var% / 3600
SET /A Var = %Var% - 3600 * %hours%
SET /A minutes = %Var% / 60
SET /A Var = %Var% - 60 * %minutes%

ECHO Your interval is %hours% hours %minutes% minutes and %Var% seconds

GOTO EOF

:EOF
