[CmdletBinding()]
param(
    [string] $Url = 'https://octowatchdlp.com/OWServerSetup.exe',
    [string] $OutFile = (Join-Path $env:TEMP 'OWServerSetup.exe')
)

$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$root = Split-Path -Parent $PSScriptRoot

Write-Host "Downloading $Url ..."
Invoke-WebRequest -Uri $Url -OutFile $OutFile -UseBasicParsing
$hash = (Get-FileHash -Path $OutFile -Algorithm SHA256).Hash
$ver = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($OutFile).FileVersion.Trim()
$size = (Get-Item $OutFile).Length

Write-Host "Version=$ver"
Write-Host "SHA256=$hash"
Write-Host "SizeBytes=$size"
Write-Host "Update versions.json, nuspec, chocolateyInstall.ps1, winget templates, and InstallerManifest.json with these values."
Write-Host "Repo root: $root"