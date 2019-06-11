@ECHO OFF

SETLOCAL enableextensions disabledelayedexpansion
:: Checking dates file existings
IF NOT EXIST Dates.txt GOTO ERROR
:: getting today and tomorrow dates
FOR /f "tokens=2 delims==" %%a IN ('wmic OS Get localdatetime /value') DO SET "dt=%%a"

SET "td.YYYY=%dt:~0,4%"

SET "td.MM=%dt:~4,2%"
SET "td.DD=%dt:~6,2%"

:: remove padding from date elements and increase day
SET /a "y=%td.YYYY%", "m=100%td.MM% %% 100", "d=(100%td.DD% %% 100)+1"

:: calculate month length
SET /a "ml=30+((m+m/8) %% 2)" & IF %m% EQU 2 SET /a "ml=ml-2+(3-y %% 4)/3-(99-y %% 100)/99+(399-y %% 400)/399"

:: adjust day / month / year for tomorrow date
IF %d% GTR %ml% SET /a "d=1", "m=(m %% 12)+1", "y+=(%m%/12)"

:: pad date elements and SET tomorrow variables
SET /a "m+=100", "d+=100"

SET "tm.YYYY=%y%"

SET "tm.MM=%m:~-2%"
SET "tm.DD=%d:~-2%"

SET today=%td.DD%.%td.MM%.%td.YYYY%
SET tomorrow=%tm.DD%.%tm.MM%.%tm.YYYY%

:: echoing today and tomorrow dates
ECHO Today   : %today%
ECHO Tomorrow: %tomorrow%

ECHO Your notifications for the upcoming events:

:: loop through dates file
FOR /f "tokens=1,2 delims=:" %%A IN (Dates.txt) DO (
  IF "%%B"==" %tomorrow%"
  (
    ECHO Tomorrow you are going to this event: %%A
    )
    )

ECHO You don't have other events for tomorrow
GOTO EOF

:ERROR

ECHO DATES.TXT WAS NOT FOUND IN CURRENT DIRECTORY!

:EOF
