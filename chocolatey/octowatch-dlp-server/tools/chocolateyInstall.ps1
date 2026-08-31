$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://octowatchdlp.com/OWServerSetup.exe'
  checksum       = '40E1C57CFE23E38C15E07CAA87FEFC6A3315792F4DD40A765BB7BB0996E17FA2'
  checksumType   = 'sha256'
  softwareName   = 'OctoWatch Server*'
  silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
  validExitCodes = @(0)
}

Write-Host 'Installing OctoWatch Server. Internet access may be required for Windows IIS/DISM features. Microsoft SQL Server is not installed by this package.'
Install-ChocolateyPackage @packageArgs