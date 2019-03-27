@echo off
rem no safe bet (for comparisons)
Powershell.exe -executionpolicy RemoteSigned -noexit -file "%~dp0WinPython_PS_Prompt.ps1"
