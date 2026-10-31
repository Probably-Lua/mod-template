@echo off
setlocal EnableExtensions DisableDelayedExpansion

set "root=%~dp0"

if not "%~1"=="" goto game_arg
if defined PROBABLY_STOLEN_DIR goto game_env

set "game=%ProgramFiles(x86)%\Steam\steamapps\common\Probably Stolen"
goto game_ready

:game_arg
set "game=%~1"
goto game_ready

:game_env
set "game=%PROBABLY_STOLEN_DIR%"

:game_ready
set "managed=%game%\Probably Stolen_Data\Managed"

where dotnet >nul 2>&1
if errorlevel 1 (
    echo Missing .NET SDK ^(dotnet^). 1>&2
    exit /b 1
)

if not exist "%managed%\Assembly-CSharp.dll" (
    echo Game assembly not found: "%managed%\Assembly-CSharp.dll" 1>&2
    echo Usage: %~nx0 "C:\path\to\Probably Stolen" 1>&2
    exit /b 1
)

dotnet build "%root%stub\Stub.csproj" -c Release "-p:GameManagedDir=%managed%"
if errorlevel 1 exit /b 1

set "built=%root%stub\bin\Release\netstandard2.1\StubLuaModDLL.dll"
if not exist "%built%" (
    echo Built DLL not found: "%built%" 1>&2
    exit /b 1
)
for %%F in ("%built%") do if %%~zF EQU 0 (
    echo Built DLL is empty: "%built%" 1>&2
    exit /b 1
)

set "package=%root%dist\ProbablyLuaExample"
if exist "%package%" (
    rmdir /s /q "%package%"
    if errorlevel 1 exit /b 1
)
mkdir "%package%\lua" || exit /b 1

copy /y "%root%manifest.xml" "%package%\manifest.xml" >nul || exit /b 1
copy /y "%built%" "%package%\StubLuaModDLL.dll" >nul || exit /b 1
xcopy /e /i /y /h "%root%lua\*" "%package%\lua" >nul || exit /b 1

for %%D in (Textures Sounds Localization LootTables) do (
    if exist "%root%%%D" (
        xcopy /e /i /y /h "%root%%%D\*" "%package%\%%D" >nul
        if errorlevel 1 exit /b 1
    )
)

echo Packaged: "%package%"
exit /b 0
