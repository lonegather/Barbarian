
###############################
### WinPython_PS_Prompt.ps1 ###
###############################
$0 = $myInvocation.MyCommand.Definition
$dp0 = [System.IO.Path]::GetDirectoryName($0)

# avoid double_init (will only resize screen)
if (-not $env:WINPYDIR -eq "$dp0\..\python-3.4.4.amd64")  {

# $env:WINPYDIR = '$pwd\..\python-3.4.4.amd64'
$env:WINPYDIR = "$dp0\..\python-3.4.4.amd64"

$env:WINPYDIR = "$dp0\..\python-2.7.11.amd64"
$env:WINPYVER = '2.7.11.1Zerob5'
$env:HOME = "$env:WINPYDIR\..\settings"
$env:JUPYTER_DATA_DIR = "$env:HOME"
$env:WINPYARCH = 'WIN32'
if ($env:WINPYARCH.subString($env:WINPYARCH.length-5, 5) -eq 'amd64')  {
   $env:WINPYARCH = 'WIN-AMD64' } 


if (-not $env:PATH.ToLower().Contains(";"+ $env:WINPYDIR.ToLower()+ ";"))  {
 $env:PATH = "$env:WINPYDIR\Lib\site-packages\PyQt5;$env:WINPYDIR\Lib\site-packages\PyQt4;$env:WINPYDIR\;$env:WINPYDIR\DLLs;$env:WINPYDIR\Scripts;$env:WINPYDIR\..\tools;$env:WINPYDIR\..\tools\mingw32\bin;$env:WINPYDIR\..\tools\R\bin\x64;$env:WINPYDIR\..\tools\Julia\bin;$env:path;" }

#rem force default pyqt5 kit for Spyder if PyQt5 module is there
if (Test-Path "$env:WINPYDIR\Lib\site-packages\PyQt5") { $env:QT_API = "pyqt5" } 



#####################
### handle R if included
#####################
if (Test-Path "$env:WINPYDIR\..\tools\R\bin") { 
    $env:R_HOME = "$env:WINPYDIR\..\tools\R"
    $env:R_HOMEbin = "$env:R_HOME\bin\x64"
    if ("$env:WINPYARCH" -eq "WIN32") {
        $env:R_HOMEbin = "$env:R_HOME\bin\i386"
    }
}

#####################
### handle Julia if included
#####################
if (Test-Path "$env:WINPYDIR\..\tools\Julia\bin") {
    $env:JULIA_HOME = "$env:WINPYDIR\..\tools\Julia\bin\"
    $env:JULIA_EXE = "julia.exe"
    $env:JULIA = "$env:JULIA_HOME$env:JULIA_EXE"
    $env:JULIA_PKGDIR = "$env:WINPYDIR\..\settings\.julia"
}

#####################
### WinPython.ini part (removed from nsis)
#####################
if (-not (Test-Path "$env:WINPYDIR\..\settings")) { md -Path "$env:WINPYDIR\..\settings" }
$env:winpython_ini = "$env:WINPYDIR\..\settings\winpython.ini"
if (-not (Test-Path $env:winpython_ini)) {
    "[debug]" | Add-Content -Path $env:winpython_ini
    "state = disabled" | Add-Content -Path $env:winpython_ini
    "[environment]" | Add-Content -Path $env:winpython_ini
    "## <?> Uncomment lines to override environment variables" | Add-Content -Path $env:winpython_ini
    "#HOME = %%HOMEDRIVE%%%%HOMEPATH%%\Documents\WinPython%%WINPYVER%%" | Add-Content -Path $env:winpython_ini
    "#JUPYTER_DATA_DIR = %%HOME%%" | Add-Content -Path $env:winpython_ini
    "#WINPYWORKDIR = %%HOMEDRIVE%%%%HOMEPATH%%\Documents\WinPython%%WINPYVER%%\Notebooks" | Add-Content -Path $env:winpython_ini
}


} 
###############################
### Set-WindowSize
###############################
Function Set-WindowSize {
Param([int]$x=$host.ui.rawui.windowsize.width,
      [int]$y=$host.ui.rawui.windowsize.heigth,
      [int]$buffer=$host.UI.RawUI.BufferSize.heigth)
    
    $buffersize = new-object System.Management.Automation.Host.Size($x,$buffer)
    $host.UI.RawUI.BufferSize = $buffersize
    $size = New-Object System.Management.Automation.Host.Size($x,$y)
    $host.ui.rawui.WindowSize = $size   
}

Set-WindowSize 150 40 6000 

### Colorize to distinguish
#$host.ui.RawUI.BackgroundColor = "DarkBlue"
$host.ui.RawUI.ForegroundColor = "White"

