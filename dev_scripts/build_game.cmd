@echo off
setlocal enabledelayedexpansion

set THISDIR=%~dp0
set THISDIR=%THISDIR:~0,-1%
set AGSEDITOR="C:\Program Files (x86)\Adventure Game Studio 3.5.0\AGSEditor.exe"
set AGSGAMEPROJECT=%THISDIR%\..\I_rented_a_boat

if [%~1]==[] goto :NOPARAM
set AGSGAMEPROJECT="%~1"

:NOPARAM

call %AGSEDITOR% /compile %AGSGAMEPROJECT%\Game.agf

endlocal
