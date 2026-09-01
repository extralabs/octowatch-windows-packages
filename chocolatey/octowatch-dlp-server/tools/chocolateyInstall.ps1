$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Verifier default is 2700s; On-Prem Server (IIS/DISM + large Inno) often needs longer.
# If the process is waiting on a UI/SQL prompt, timeout alone will not help — see package review notes.
$logFile = Join-Path $env:TEMP 'OWServerSetup-chocolatey.log'

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url            = 'https://octowatchdlp.com/OWServerSetup.exe'
  checksum       = '40E1C57CFE23E38C15E07CAA87FEFC6A3315792F4DD40A765BB7BB0996E17FA2'
  checksumType   = 'sha256'
  softwareName   = 'OctoWatch Server*'
  silentArgs     = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP- /NOCANCEL /CLOSEAPPLICATIONS /LOG=`"$logFile`""
  validExitCodes = @(0, 3010)
  timeout        = 7200
}

Write-Host 'Installing OctoWatch Server (On-Premise).'
Write-Host 'Prerequisites: administrator rights; Microsoft SQL Server 2014+ must already be available.'
Write-Host 'Internet may be required so Windows can enable IIS features via DISM.'
Write-Host "Inno Setup log (if created): $logFile"

Install-ChocolateyPackage @packageArgs
