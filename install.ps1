# ==============================================================================
# Harmonix Music - Windows Installer Script
# One-line execution: irm https://raw.githubusercontent.com/NandiVardhan2007/Harmonix/main/install.ps1 | iex
# ==============================================================================

$ErrorActionPreference = 'Stop'

Write-Host ""
Write-Host "  ================================================================" -ForegroundColor Cyan
Write-Host "                      HARMONIX FOR WINDOWS                       " -ForegroundColor White
Write-Host "       HD Music Streaming * Synced Lyrics * Cross-Device Sync     " -ForegroundColor DarkCyan
Write-Host "  ================================================================" -ForegroundColor Cyan
Write-Host ""

# Ensure running on Windows
if ($env:OS -ne "Windows_NT") {
    Write-Error "Harmonix desktop installer is currently supported only on Windows."
    exit 1
}

# 1. Fetch Latest Release Information from Public Releases Mirror
$RepoPrimary = "NandiVardhan2007/Harmonix-Releases"
$RepoFallback = "NandiVardhan2007/Harmonix"
$ApiUrl = "https://api.github.com/repos/$RepoPrimary/releases/latest"

Write-Host "  [1/3] Checking latest release from $RepoPrimary..." -ForegroundColor Yellow

$release = $null
try {
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $headers = @{ "User-Agent" = "Harmonix-PowerShell-Installer" }
    $response = Invoke-RestMethod -Uri $ApiUrl -Headers $headers -Method Get -TimeoutSec 15
    $release = $response
} catch {
    Write-Host "        Primary release repo check failed, checking fallback ($RepoFallback)..." -ForegroundColor DarkGray
    try {
        $FallbackUrl = "https://api.github.com/repos/$RepoFallback/releases/latest"
        $release = Invoke-RestMethod -Uri $FallbackUrl -Headers $headers -Method Get -TimeoutSec 15
    } catch {
        Write-Error "Failed to fetch release information from GitHub: $($_.Exception.Message)"
        exit 1
    }
}

$version = $release.tag_name
Write-Host "        Latest version detected: $version" -ForegroundColor Green

# 2. Locate Windows Installer Asset (.exe)
$installerAsset = $release.assets | Where-Object {
    $_.name -match '^Harmonix[-_ ]Setup.*\.exe$' -or ($_.name -like "*.exe" -and $_.name -like "*Setup*")
} | Select-Object -First 1

if (-not $installerAsset) {
    # Fallback to any .exe asset
    $installerAsset = $release.assets | Where-Object { $_.name -like "*.exe" } | Select-Object -First 1
}

if (-not $installerAsset) {
    Write-Error "No Windows installer (.exe) was found in release $version. Please download manually from: $($release.html_url)"
    exit 1
}

$downloadUrl = $installerAsset.browser_download_url
$fileName = $installerAsset.name
$tempDir = [System.IO.Path]::GetTempPath()
$targetPath = Join-Path $tempDir "Harmonix-Setup.exe"

# 3. Download Installer
Write-Host "  [2/3] Downloading $fileName ($([math]::Round($installerAsset.size / 1MB, 1)) MB)..." -ForegroundColor Yellow

try {
    # Remove older cached installer if present
    if (Test-Path $targetPath) {
        Remove-Item $targetPath -Force -ErrorAction SilentlyContinue
    }

    Invoke-WebRequest -Uri $downloadUrl -OutFile $targetPath -UseBasicParsing
    Write-Host "        Download completed successfully." -ForegroundColor Green
} catch {
    Write-Error "Download failed: $($_.Exception.Message)"
    exit 1
}

# 4. Launch Installer
Write-Host "  [3/3] Launching Harmonix Setup..." -ForegroundColor Yellow
try {
    Start-Process -FilePath $targetPath
    Write-Host ""
    Write-Host "  Setup has launched. Follow the on-screen installer to complete installation." -ForegroundColor Cyan
    Write-Host "  Enjoy listening with Harmonix!" -ForegroundColor Green
    Write-Host ""
} catch {
    Write-Error "Failed to start the installer process: $($_.Exception.Message)"
    exit 1
}
