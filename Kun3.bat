@ECHO OFF

SETLOCAL enableextensions disabledelayedexpansion

FOR /f "tokens=2 delims==" %%a IN ('wmic OS Get localdatetime /value') DO SET "dt=%%a"
SET "td.YY=%dt:~2,2%"
SET "td.YYYY=%dt:~0,4%"
SET "td.MM=%dt:~4,2%"
SET "td.DD=%dt:~6,2%"

rem Remove padding from date elements and increase day
SET /a "y=%td.YYYY%", "m=100%td.MM% %% 100", "d=(100%td.DD% %% 100)+1"
rem Calculate month length
SET /a "ml=30+((m+m/8) %% 2)" & if %m% equ 2 SET /a "ml=ml-2+(3-y %% 4)/3-(99-y %% 100)/99+(399-y %% 400)/399"
rem Adjust day / month / year for tomorrow date
If %d% gtr %ml% SET /a "d=1", "m=(m %% 12)+1", "y+=(%m%/12)"

rem Pad date elements and SET tomorrow variables
SET /a "m+=100", "d+=100"

SET "tm.YYYY=%y%"
SET "tm.YY=%y:~-2%"
SET "tm.MM=%m:~-2%"
SET "tm.DD=%d:~-2%"

ECHO Today   : %td.YYYY% / %td.MM% / %td.DD%
ECHO Tomorrow: %tm.YYYY% / %tm.MM% / %tm.DD%

:EOF
