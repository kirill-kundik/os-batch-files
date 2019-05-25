@ECHO OFF
:ENTER_NUMBER

SET Number=0

SET /P UserInput=Please Enter a Number from 0:
SET /A Number="%UserInput%"*1

:: Checking if user entered a number
If %Number%==%UserInput% (
  :: ECHO You entered the number %Var%
  ) else (
  ECHO Your input "%UserInput%" is not a number
  GOTO ENTER_NUMBER
  )

:: Checking if number is in range 0 .. 86400

If %Number% lss 0 (
  ECHO Your number %Number% is less than 0
  GOTO ENTER_NUMBER
  )

:ENTER_BASE
SET Base=0

SET /P UserInput=Please Enter a Base from 2 to 16:
SET /A Base="%UserInput%"*1

:: Checking if user entered a number
If %Base%==%UserInput% (
  :: ECHO You entered the number %Var%
  ) else (
  ECHO Your input "%UserInput%" is not a number
  GOTO ENTER_BASE
  )

:: Checking if number is in range 0 .. 86400

If %Base% LSS 2 (
  ECHO Your base %Base% is less than 2
  GOTO ENTER_BASE
  )

If %Base% GTR 16 (
  ECHO Your base %Base% is greater than 16
  GOTO ENTER_BASE
  )

ECHO Your number is %Number% and your base is %Base%

SET Numbers=0123456789ABCDEF
SET "Result="
SET _length=1

setlocal enabledelayedexpansion
:WHILE_TRUE

If %Number% GEQ %BASE% (
  SET /A "Div=Number %% Base"
  REM SET /A Div = !Div!
  CALL SET Result=%%Numbers:~!Div!,%_length%%%%Result%
  SET /A "Number /= Base"

  GOTO WHILE_TRUE
  )

CALL SET Result=%%Numbers:~%Number%,%_length%%%%Result%
ECHO Result is %Result%

endlocal

GOTO EOF

:EOF
