@echo off

if "%MAYA_MODULE_PATH%"=="Z:\Workflow\Barbarian_1.0\modules" goto SKIP

:INSTALL
setx MAYA_MODULE_PATH "Z:\Workflow\Barbarian_1.0\modules" /M
setx MAYA_SCRIPT_PATH "Z:\Workflow\Barbarian_1.0\commons\scripts" /M
setx PYTHONPATH "Z:\Workflow\Barbarian_1.0\commons\scripts" /M
echo Pipeline deployment successully done.
goto END

:SKIP
echo Pipeline already deployed. Procedure cancelled.
goto END

:END
