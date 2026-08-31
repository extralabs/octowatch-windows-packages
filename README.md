# OctoWatch Windows Packages

Packaging overlays for the official **OctoWatch Server** installer (`OWServerSetup.exe`).

This repository does **not** rebuild Inno Setup binaries. Packages download the signed installer from [octowatchdlp.com](https://octowatchdlp.com/?utm_source=github&utm_medium=asset&utm_campaign=windows_packages_2026) and run it silently.

## Scope (current)

| Component | Package | Status |
|-----------|---------|--------|
| On-Premise Server | Chocolatey `octowatch-dlp-server` | Ready to pack / push |
| On-Premise Server | winget `OctoWatch.OctoWatchDLP.Server` | Manifests ready for PR |
| Deploy helpers | PowerShell Gallery `OctoWatchDLP` | Module ready to publish |
| Grabber agent | — | Deferred |

## Quick links

- Product: https://octowatchdlp.com/
- Docs: https://octowatchdlp.com/docs/
- Download / trial: https://octowatchdlp.com/download/
- Pricing: https://octowatchdlp.com/pricing/
- Updates: https://octowatchdlp.com/category/updates/
- License: https://octowatchdlp.com/license/
- Support: info@octowatchdlp.com

## Install examples

### Chocolatey

```powershell
choco install octowatch-dlp-server -y
```

### winget (after merge to winget-pkgs)

```powershell
winget install --id OctoWatch.OctoWatchDLP.Server
```

### PowerShell Gallery

```powershell
Install-Module OctoWatchDLP -Scope CurrentUser
Install-OctoWatchServer
```

## Requirements

- Windows with administrator rights
- Internet access during Server setup (IIS / DISM feature download may contact Microsoft)
- Microsoft SQL Server 2014+ for the On-Premise database (Express is commonly used; not installed by this package)

## Maintainer notes

See [RELEASE.md](RELEASE.md) for version bumps and checksum updates.

Publisher: **KOLIBRI LLC**. OctoWatch DLP is not affiliated with Octo Browser.
