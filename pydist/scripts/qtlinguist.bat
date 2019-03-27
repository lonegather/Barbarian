@echo off
call "%~dp0env_for_icons.bat"
cd/D "%WINPYWORKDIR%"
if "%QT_API%"=="pyqt5" (
    cd/D "%WINPYDIR%\Lib\site-packages\PyQt5"
    "%WINPYDIR%\Lib\site-packages\PyQt5\linguist.exe" %*
) else (
    cd/D "%WINPYDIR%\Lib\site-packages\PyQt4"
    "%WINPYDIR%\Lib\site-packages\PyQt4\linguist.exe" %*
)
