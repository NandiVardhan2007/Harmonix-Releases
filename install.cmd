@echo off
:: ==============================================================================
:: Harmonix Music - Windows CMD Installer
:: One-line execution:
::   powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/NandiVardhan2007/Harmonix-Releases/main/install.ps1 | iex"
:: ==============================================================================

setlocal enabledelayedexpansion

echo.
echo   ================================================================
echo                       HARMONIX FOR WINDOWS                        
echo        HD Music Streaming * Synced Lyrics * Cross-Device Sync     
echo   ================================================================
echo.

echo   [1/2] Invoking Harmonix PowerShell Installer...
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "irm https://raw.githubusercontent.com/NandiVardhan2007/Harmonix-Releases/main/install.ps1 | iex"

if %ERRORLEVEL% neq 0 (
    echo.
    echo   PowerShell launcher failed. Downloading Harmonix-Setup.exe directly via curl...
    curl.exe -fL --retry 3 --progress-bar -o "%TEMP%\Harmonix-Setup.exe" "https://github.com/NandiVardhan2007/Harmonix-Releases/releases/latest/download/Harmonix-Setup.exe"
    if exist "%TEMP%\Harmonix-Setup.exe" (
        echo   [2/2] Launching Harmonix-Setup.exe...
        start "" "%TEMP%\Harmonix-Setup.exe"
    ) else (
        echo   Failed to download Harmonix installer. Please download manually from:
        echo   https://github.com/NandiVardhan2007/Harmonix-Releases/releases/latest
        exit /b 1
    )
)

endlocal
