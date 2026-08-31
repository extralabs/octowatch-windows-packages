#Requires -Version 5.1

$script:ManifestPath = Join-Path $PSScriptRoot 'InstallerManifest.json'

Get-ChildItem -Path (Join-Path $PSScriptRoot 'Public') -Filter '*.ps1' -ErrorAction SilentlyContinue |
    ForEach-Object { . $_.FullName }

Export-ModuleMember -Function Install-OctoWatchServer, Get-OctoWatchInstallerInfo