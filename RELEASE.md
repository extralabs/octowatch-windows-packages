# Release checklist — OctoWatch Server packages

1. Publish signed `OWServerSetup.exe` to `https://octowatchdlp.com/OWServerSetup.exe`.
2. Run `scripts/Update-Checksums.ps1` (or hash locally and update files by hand).
3. Align versions in:
   - `versions.json`
   - `chocolatey/octowatch-dlp-server/octowatch-dlp-server.nuspec`
   - `chocolatey/.../tools/chocolateyInstall.ps1` (checksum)
   - `winget/templates/OctoWatch.OctoWatchDLP.Server/*`
   - `powershell/OctoWatchDLP/InstallerManifest.json`
4. Refresh unique EN-US release notes if the product story changed.
5. Local tests:
   - `choco pack` then `choco install octowatch-dlp-server -s . -y --force`
   - Confirm ARP DisplayName / ProductCode
   - `choco uninstall octowatch-dlp-server -y`
   - `winget install --manifest winget/templates/OctoWatch.OctoWatchDLP.Server`
   - `Test-ModuleManifest powershell/OctoWatchDLP/OctoWatchDLP.psd1`
6. Publish:
   - `choco push octowatch-dlp-server.<ver>.nupkg --source https://push.chocolatey.org/`
   - Open PR to `microsoft/winget-pkgs`
   - `Publish-Module -Path .\powershell\OctoWatchDLP -NuGetApiKey <key>`

## Notes

- Package module version (`OctoWatchDLP` 1.x) is independent of Server FileVersion.
- Grabber packaging remains deferred (PublicID / PIN).
