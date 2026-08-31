# OctoWatch Windows Packages

Official packaging overlays for **OctoWatch Server** (`OWServerSetup.exe`) — the On-Premise control plane for [OctoWatch DLP](https://octowatchdlp.com/?utm_source=github&utm_medium=asset&utm_campaign=windows_packages_2026) by **KOLIBRI LLC**.

This repository does **not** rebuild Inno Setup binaries. Chocolatey, winget, and PowerShell Gallery packages download the signed installer from octowatchdlp.com and run it silently.

## Current scope

| Component | Package | Status |
|-----------|---------|--------|
| On-Premise Server | Chocolatey `octowatch-dlp-server` | Ready to push |
| On-Premise Server | winget `OctoWatch.OctoWatchDLP.Server` | [PR #426779](https://github.com/microsoft/winget-pkgs/pull/426779) |
| Deploy helpers | PowerShell Gallery `OctoWatchDLP` | Ready to publish |
| Grabber agent | — | Deferred |

## Product links

- Homepage: https://octowatchdlp.com/
- On-Premise: https://octowatchdlp.com/on-premise/
- Documentation: https://octowatchdlp.com/docs/
- Trial download: https://octowatchdlp.com/download/
- Pricing: https://octowatchdlp.com/pricing/
- Updates: https://octowatchdlp.com/category/updates/
- License: https://octowatchdlp.com/license/
- Support: info@octowatchdlp.com

## Install (after packages are published)

### Chocolatey

```powershell
choco install octowatch-dlp-server -y
```

### winget

```powershell
winget install --id OctoWatch.OctoWatchDLP.Server
```

### PowerShell Gallery

```powershell
Install-Module OctoWatchDLP -Scope CurrentUser
Install-OctoWatchServer
```

## Requirements

- Administrator rights on Windows
- Internet access may be required during Server setup (IIS / DISM feature download from Microsoft)
- Microsoft SQL Server 2014+ for the On-Premise database (not installed by these packages)
- 14-day trial available (up to 15 users); production use requires a license

## Maintainer docs

- [PUBLISH.md](PUBLISH.md) — accounts, API keys, push / PR steps
- [RELEASE.md](RELEASE.md) — version and checksum updates

**Disambiguation:** OctoWatch DLP is Windows employee monitoring and endpoint DLP for authorized employer use. It is **not** Octo Browser.
