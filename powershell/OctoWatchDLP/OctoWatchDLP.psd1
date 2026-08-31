@{
    RootModule        = 'OctoWatchDLP.psm1'
    ModuleVersion     = '1.0.0'
    GUID              = '7a07b0e8-2050-4edc-a61e-46ac163d7693'
    Author            = 'KOLIBRI LLC'
    CompanyName       = 'KOLIBRI LLC'
    Copyright         = '(c) KOLIBRI LLC. All rights reserved.'
    Description       = 'Deploy the OctoWatch DLP On-Premise Server on Windows with checksum-verified downloads and silent Inno Setup switches. Grabber helpers are planned for a later release.'
    PowerShellVersion = '5.1'
    FunctionsToExport = @('Install-OctoWatchServer', 'Get-OctoWatchInstallerInfo')
    CmdletsToExport   = @()
    VariablesToExport = @()
    AliasesToExport   = @()
    PrivateData       = @{
        PSData = @{
            Tags         = @('OctoWatch', 'DLP', 'EmployeeMonitoring', 'OnPremise', 'Windows', 'Deployment')
            LicenseUri   = 'https://octowatchdlp.com/license/'
            ProjectUri   = 'https://octowatchdlp.com/?utm_source=powershellgallery&utm_medium=asset&utm_campaign=psgallery_2026'
            ReleaseNotes = 'https://octowatchdlp.com/category/updates/'
        }
    }
}