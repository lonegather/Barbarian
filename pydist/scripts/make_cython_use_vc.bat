@echo off
call "%~dp0env.bat"
set pydistutils_cfg=%WINPYDIR%\..\settings\pydistutils.cfg
echo [config]>%pydistutils_cfg%
        