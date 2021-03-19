@echo off
setlocal enabledelayedexpansion
setlocal enableextensions

if not defined TAR (
   where tar >nul 2>&1 || goto :ERROR-NOTAR
   set TAR=tar
)

"%TAR%" --help | find "(bsdtar)" >nul || goto :ERROR-WRONGTAR

set MODULE_NAME=I_rented_a_boat
set GAME_NAME=I_rented_a_boat
set GAME_LINUX_NAME=%GAME_NAME%_linux
set GAME_WINDOWS_NAME=%GAME_NAME%_windows
set THISDIR=%~dp0
set THISDIR=%THISDIR:~0,-1%
set AGSTAR=%THISDIR%\ags-tar.cmd
set AGSGAMEPROJECT=%THISDIR%\..\%GAME_NAME%
set BUILDDIR=%THISDIR%\BUILD
set BUILDDIRWINDOWS=%THISDIR%\BUILD\%GAME_WINDOWS_NAME%
set BUILDDIRLINUX=%THISDIR%\BUILD\%GAME_LINUX_NAME%
set DISTDIR=%THISDIR%\DIST

if [%~1]==[] goto :NOPARAM
set AGSGAMEPROJECT="%~1"

:NOPARAM

md "%BUILDDIRWINDOWS%"
md "%BUILDDIRLINUX%"
md "%DISTDIR%"
del "%BUILDDIRWINDOWS%\*" /f /q /s
del "%BUILDDIRLINUX%\*" /f /q /s
del "%DISTDIR%\*" /f /q /s
set COMPILEDDIRWINDOWS="%AGSGAMEPROJECT%\Compiled\Windows"
set COMPILEDDIRLINUX="%AGSGAMEPROJECT%\Compiled\Linux"

xcopy /e /k /h /i "%COMPILEDDIRWINDOWS%\*" "%BUILDDIRWINDOWS%"
xcopy /e /k /h /i "%COMPILEDDIRLINUX%\*" "%BUILDDIRLINUX%"


"%TAR%" -a -cf "%DISTDIR%\%GAME_WINDOWS_NAME%.zip" "%BUILDDIRWINDOWS%"
pushd "%DISTDIR%"
call "%AGSTAR%" "%BUILDDIRLINUX%\%GAME_NAME%"
del /q %GAME_NAME%.mtree
ren %GAME_NAME%.tar.gz %GAME_LINUX_NAME%.tar.gz
popd

goto :END

:ERROR-NOTAR
1>&2 echo No version of tar is available
exit /b 1

:ERROR-WRONGTAR
1>&2 echo The version of tar which was found wasn't bsdtar
exit /b 1

:END
endlocal
