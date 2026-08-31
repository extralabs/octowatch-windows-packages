function Install-OctoWatchServer {
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'High')]
    param(
        [string] $InstallerUrl,
        [string] $ExpectedSha256
    )

    $principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        throw 'Install-OctoWatchServer must run in an elevated PowerShell session.'
    }

    $info = Get-OctoWatchInstallerInfo -Component Server
    if (-not $InstallerUrl) { $InstallerUrl = $info.Url }
    if (-not $ExpectedSha256) { $ExpectedSha256 = $info.Sha256 }

    Write-Warning 'OctoWatch Server setup may require internet access for Windows IIS/DISM features. Microsoft SQL Server is not installed by this cmdlet.'

    $temp = Join-Path ([System.IO.Path]::GetTempPath()) ("OWServerSetup_{0}.exe" -f ([guid]::NewGuid().ToString('N')))
    try {
        if ($PSCmdlet.ShouldProcess($InstallerUrl, 'Download OctoWatch Server installer')) {
            Write-Verbose "Downloading $InstallerUrl"
            Invoke-WebRequest -Uri $InstallerUrl -OutFile $temp -UseBasicParsing
        }
        else {
            return
        }

        $actual = (Get-FileHash -Path $temp -Algorithm SHA256).Hash
        if ($actual -ne $ExpectedSha256) {
            throw "SHA256 mismatch. Expected $ExpectedSha256, got $actual"
        }

        $argList = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
        if ($PSCmdlet.ShouldProcess($temp, "Silent install ($argList)")) {
            $p = Start-Process -FilePath $temp -ArgumentList $argList -Wait -PassThru
            if ($p.ExitCode -ne 0) {
                throw "Installer exited with code $($p.ExitCode)"
            }
            Write-Host "OctoWatch Server install finished (exit $($p.ExitCode)). Version $($info.Version)."
        }
    }
    finally {
        if (Test-Path -LiteralPath $temp) {
            Remove-Item -LiteralPath $temp -Force -ErrorAction SilentlyContinue
        }
    }
}