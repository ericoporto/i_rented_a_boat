@echo off
setlocal enabledelayedexpansion

if not defined TAR (
   where tar >nul 2>&1 || goto :error-notar
   set TAR=tar
)

"%TAR%" --help | find "(bsdtar)" >nul || goto :error-wrongtar
if "%~1" == "" goto :usage
set GAME_PATH="%~1"
if not exist %GAME_PATH% goto :error-nogame

set GAME_DIR="%~dp1."
set GAME_ARCHIVE="%~nx1.tar.gz"
set GAME_MTREE="%~nx1.mtree"

for /f %%a in ('certutil -hashfile %GAME_PATH% SHA1 ^| find /v " "') do set SHA1=%%a

for /f "tokens=1-6 delims= " %%a in ('^""%TAR%" -acf - --format mtree --options mtree:^^^!all^,mode^,gid^,uid^,type^,sha1 -C %GAME_DIR% *^"') do (
    if "%%b" == "" (
        REM file header
        > %GAME_MTREE% echo %%a
    ) else (
        if "%%f" == "" (
           REM directory
           >> %GAME_MTREE% echo %%a mode=755 %%c %%d %%e
        ) else (
           REM file
           set FILE_MODE=644
           if "%%a" == "./data/ags32" set FILE_MODE=755
           if "%%a" == "./data/ags64" set FILE_MODE=755
           if "%%f" == "sha1digest=%SHA1%" set FILE_MODE=755
           >> %GAME_MTREE% echo %%a mode=!FILE_MODE! %%c %%d %%e %%f
       )
    )
)

type %GAME_MTREE% | "%TAR%" -cvvzf %GAME_ARCHIVE% -C %GAME_DIR% @-
goto :end

:error-notar
1>&2 echo No version of tar is available
exit /b 1

:error-wrongtar
1>&2 echo The version of tar which was found wasn't bsdtar
exit /b 1

:error-nogame
1>&2 echo File %GAME_PATH% does not exist
exit /b 1

:usage
echo ags-tar
echo:
echo Writes a compressed tar archive of a compiled AGS game to the current
echo directory. The launch script and engine components will be flagged as
echo executable.
echo:
echo The Windows version of bsdtar must be installed. It will already be
echo pre-installed on newer versions of Windows 10. If more than one version
echo of tar is installed set the environment variable TAR to the path of the
echo one which should be used.
echo:
echo Usage:
echo     %~n0 [drive:][path]launchscript
echo:
echo Examples:
echo     %~n0 Compiled\Linux\MyGame
echo     %~n0 "D:\MyGame\Compiled\Linux\My Game"

:end
endlocal
goto :eof

MIT License

Copyright (c) 2020 Morgan Willcock

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
