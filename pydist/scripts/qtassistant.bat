@echo off
call "%~dp0env_for_icons.bat"
cd/D "%WINPYWORKDIR%"
if "%QT_API%"=="pyqt5" (
    "%WINPYDIR%\Lib\site-packages\PyQt5\assistant.exe" %*
) else (
    "%WINPYDIR%\Lib\site-packages\PyQt4\assistant.exe" %*
)
