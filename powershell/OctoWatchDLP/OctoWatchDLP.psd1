@{
    RootModule        = 'OctoWatchDLP.psm1'
    ModuleVersion     = '1.0.1'
    GUID              = '7a07b0e8-2050-4edc-a61e-46ac163d7693'
    Author            = 'KOLIBRI LLC'
    CompanyName       = 'KOLIBRI LLC'
    Copyright         = '(c) KOLIBRI LLC. All rights reserved.'
    Description       = @'
OctoWatchDLP — official PowerShell helpers for OctoWatch On-Premise Server (Windows employee monitoring + endpoint DLP).

Product home: https://octowatchdlp.com/?utm_source=psgallery&utm_medium=asset&utm_campaign=psgallery_2026
On-Premise overview: https://octowatchdlp.com/on-premise/?utm_source=psgallery&utm_medium=asset&utm_campaign=psgallery_2026
Docs: https://octowatchdlp.com/docs/
Download / trial: https://octowatchdlp.com/download/?utm_source=psgallery&utm_medium=asset&utm_campaign=psgallery_2026
License: https://octowatchdlp.com/license/

What OctoWatch is
OctoWatch is Windows employee monitoring and data loss prevention software from KOLIBRI LLC. Deploy Cloud or On-Premise. The Grabber agent captures activity on workstations and Windows Terminal Server / RDS sessions; the Web Console provides Live view, screenshots and video, application and website usage, keystrokes, email and IM, clipboard, file/USB/print events, Risks and Anomalies, productivity analytics, timesheets, network and web-forms views, plus Rules Profile enforcement (notify/block).

What this module does
- Get-OctoWatchInstallerInfo — official OWServerSetup.exe URL, FileVersion, and SHA256 checksum
- Install-OctoWatchServer — download, verify SHA256, silent Inno Setup install (/VERYSILENT)

Prerequisites
- Elevated PowerShell 5.1+
- Microsoft SQL Server 2014+ available for the OctoWatch Server database (SQL is not bundled in OWServerSetup.exe)
- Internet may be required during setup for Windows IIS / DISM features

Not included in 1.0.x
Grabber MSI/EXE deployment helpers (PublicID / PIN) are planned for a later release.

Publisher: KOLIBRI LLC. Not affiliated with Octo Browser. Commercial shareware — 14-day trial (up to 15 users). Package source: https://github.com/extralabs/octowatch-windows-packages
'@
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Install-OctoWatchServer', 'Get-OctoWatchInstallerInfo')
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Tags         = @(
                'OctoWatch',
                'DLP',
                'DataLossPrevention',
                'EmployeeMonitoring',
                'UserActivityMonitoring',
                'InsiderRisk',
                'OnPremise',
                'Windows',
                'Deployment',
                'InnoSetup',
                'Monitoring',
                'Security',
                'Productivity',
                'RDS',
                'TerminalServer'
            )
            LicenseUri   = 'https://octowatchdlp.com/license/'
            ProjectUri   = 'https://octowatchdlp.com/?utm_source=psgallery&utm_medium=asset&utm_campaign=psgallery_2026'
            IconUri      = 'https://octowatchdlp.com/wp-content/uploads/fbrfg/apple-touch-icon.png'
            ReleaseNotes = @'
1.0.1 — Richer Gallery description and Project Site link to https://octowatchdlp.com/ (SEO / discoverability). Same install cmdlets as 1.0.0.

1.0.0 — Initial release: Get-OctoWatchInstallerInfo and Install-OctoWatchServer for official OWServerSetup.exe (checksum-verified silent install). Grabber cmdlets deferred.
'@
        }
    }
}
