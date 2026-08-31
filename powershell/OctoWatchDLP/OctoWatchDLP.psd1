@{
    RootModule        = 'OctoWatchDLP.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = '7a07b0e8-2050-4edc-a61e-46ac163d7693'
    Author            = 'KOLIBRI LLC'
    CompanyName       = 'KOLIBRI LLC'
    Copyright         = '(c) KOLIBRI LLC. All rights reserved.'
    Description       = @'
PowerShell helpers to download, verify (SHA256), and silently install the official OctoWatch On-Premise Server (OWServerSetup.exe) for Windows employee monitoring and endpoint DLP.

Use Install-OctoWatchServer on an elevated session after Microsoft SQL Server 2014+ is available. Setup may need internet access for Windows IIS/DISM features. Grabber deployment helpers are planned for a later module release.

Publisher: KOLIBRI LLC. Not affiliated with Octo Browser. Commercial shareware — 14-day trial (up to 15 users) via octowatchdlp.com/download/.
'@
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Install-OctoWatchServer', 'Get-OctoWatchInstallerInfo')
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Tags         = @('OctoWatch', 'DLP', 'EmployeeMonitoring', 'OnPremise', 'Windows', 'Deployment', 'InnoSetup')
            LicenseUri   = 'https://octowatchdlp.com/license/'
            ProjectUri   = 'https://github.com/extralabs/octowatch-windows-packages'
            IconUri      = 'https://octowatchdlp.com/wp-content/uploads/fbrfg/apple-touch-icon.png'
            ReleaseNotes = @'
1.0.0 — Initial release: Get-OctoWatchInstallerInfo and Install-OctoWatchServer for the official OWServerSetup.exe (checksum-verified silent install). Grabber cmdlets deferred.
'@
        }
    }
}
