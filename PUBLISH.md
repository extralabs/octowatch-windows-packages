# Publish checklist (Server packages)

Repo: https://github.com/extralabs/octowatch-windows-packages  
Installer: `https://octowatchdlp.com/OWServerSetup.exe`  
Version: **6.0.9720.19098**  
SHA256: `40E1C57CFE23E38C15E07CAA87FEFC6A3315792F4DD40A765BB7BB0996E17FA2`

Local scaffold also lives under `_software_submit/octowatch-windows-packages/`.

## Done in repo

- [x] Chocolatey nuspec + install/uninstall scripts (UTF-8 BOM)
- [x] `choco pack` → `octowatch-dlp-server.6.0.9720.19098.nupkg`
- [x] winget multi-file manifests (validated with `winget validate`)
- [x] PowerShell module `OctoWatchDLP` 1.0.0 (`Test-ModuleManifest` OK)
- [x] GitHub public repo pushed

## Manual publish (needs your API keys / CLA)

### 1) Chocolatey

```powershell
cd chocolatey\octowatch-dlp-server
choco apikey --key <YOUR_KEY> --source https://push.chocolatey.org/
choco push octowatch-dlp-server.6.0.9720.19098.nupkg --source https://push.chocolatey.org/
```

Then watch moderation: https://community.chocolatey.org/packages/octowatch-dlp-server

Recommended: VM silent install/uninstall smoke test before push (package is ~626 MB download).

### 2) winget-pkgs

```powershell
# Option A — wingetcreate (recommended)
wingetcreate new https://octowatchdlp.com/OWServerSetup.exe
# or submit prepared manifests from winget/templates/OctoWatch.OctoWatchDLP.Server

# Option B — PR into microsoft/winget-pkgs under:
# manifests/o/OctoWatch/OctoWatchDLP.Server/6.0.9720.19098/
```

Sign Microsoft CLA on first PR. Confirm ProductCode on a real install if moderators ask.

### 3) PowerShell Gallery

```powershell
Publish-Module -Path .\powershell\OctoWatchDLP -NuGetApiKey <YOUR_PSGALLERY_KEY> -WhatIf -Verbose
Publish-Module -Path .\powershell\OctoWatchDLP -NuGetApiKey <YOUR_PSGALLERY_KEY>
```

Account: https://www.powershellgallery.com/users/account/LogOn

## Grabber

Deferred (PublicID / PIN). Do not publish Grabber packages from this sprint.
