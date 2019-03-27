@echo off
rem safe bet 
call "%~dp0env_for_icons.bat"
Powershell.exe -executionpolicy RemoteSigned -noexit -file "%~dp0WinPython_PS_Prompt.ps1"
