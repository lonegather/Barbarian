@echo off
::set regpath = HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Environment
::set evname = MAYA_MODULE_PATH
setx MAYA_MODULE_PATH "" /M
::setx MAYA_SHELF_PATH "" /M
setx MAYA_SCRIPT_PATH "" /M
setx PYTHONPATH "" /M
