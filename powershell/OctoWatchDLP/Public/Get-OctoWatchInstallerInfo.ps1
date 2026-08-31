function Get-OctoWatchInstallerInfo {
    [CmdletBinding()]
    param(
        [ValidateSet('Server')]
        [string] $Component = 'Server'
    )

    if (-not (Test-Path -LiteralPath $script:ManifestPath)) {
        throw "Installer manifest not found: $script:ManifestPath"
    }

    $all = Get-Content -LiteralPath $script:ManifestPath -Raw -Encoding UTF8 | ConvertFrom-Json
    $info = $all.$Component
    if (-not $info) {
        throw "Component '$Component' is not defined in InstallerManifest.json"
    }

    [pscustomobject]@{
        Component   = $Component
        Version     = $info.Version
        Url         = $info.Url
        Sha256      = $info.Sha256
        ProductName = $info.ProductName
        Publisher   = $info.Publisher
        ProductCode = $info.ProductCode
        Notes       = $info.Notes
    }
}