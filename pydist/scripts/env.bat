@echo off
set WINPYDIR=%~dp0..\python-2.7.11.amd64
set WINPYVER=2.7.11.1Zerob5
set HOME=%~dp0..\settings
set JUPYTER_DATA_DIR=%HOME%
set WINPYARCH=WIN32
if  "%WINPYDIR:~-5%"=="amd64" set WINPYARCH=WIN-AMD64
echo ;%PATH%; | find /C /I ";%WINPYDIR%\;" >nul
if %ERRORLEVEL% NEQ 0 set PATH=%WINPYDIR%\Lib\site-packages\PyQt5;%WINPYDIR%\Lib\site-packages\PyQt4;%WINPYDIR%\;%WINPYDIR%\DLLs;%WINPYDIR%\Scripts;%WINPYDIR%\..\tools;%WINPYDIR%\..\tools\mingw32\bin;%WINPYDIR%\..\tools\R\bin\x64;%WINPYDIR%\..\tools\Julia\bin;%PATH%;

rem force default pyqt5 kit for Spyder if PyQt5 module is there
if exist "%WINPYDIR%\Lib\site-packages\PyQt5" set QT_API=pyqt5

rem ******************
rem handle R if included
rem ******************
if exist "%WINPYDIR%\..\tools\R\bin" (
    set R_HOME=%WINPYDIR%\..\tools\R
    if "%WINPYARCH%"=="WIN32" (
        set R_HOMEbin=%R_HOME%\bin\i386
    ) else (
        set R_HOMEbin=%R_HOME%\bin\x64
    )
)

rem ******************
rem handle Julia if included
rem ******************
if exist "%WINPYDIR%\..\tools\Julia\bin" (
    set JULIA_HOME=%WINPYDIR%\..\tools\Julia\bin\
    set JULIA_EXE=julia.exe
    set JULIA=%JULIA_HOME%%JULIA_EXE%
    set JULIA_PKGDIR=%WINPYDIR%\..\settings\.julia
)

rem ******************
rem WinPython.ini part (removed from nsis)
rem ******************
if not exist "%WINPYDIR%\..\settings" mkdir "%WINPYDIR%\..\settings" 
set winpython_ini=%WINPYDIR%\..\settings\winpython.ini
if not exist "%winpython_ini%" (
    echo [debug]>>"%winpython_ini%"
    echo state = disabled>>"%winpython_ini%"
    echo [environment]>>"%winpython_ini%"
    echo ## <?> Uncomment lines to override environment variables>>"%winpython_ini%"
    echo #HOME = %%HOMEDRIVE%%%%HOMEPATH%%\Documents\WinPython%%WINPYVER%%>>"%winpython_ini%"
    echo #JUPYTER_DATA_DIR = %%HOME%%>>"%winpython_ini%"
    echo #WINPYWORKDIR = %%HOMEDRIVE%%%%HOMEPATH%%\Documents\WinPython%%WINPYVER%%\Notebooks>>"%winpython_ini%"
)
