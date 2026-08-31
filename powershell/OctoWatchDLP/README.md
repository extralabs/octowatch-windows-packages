# OctoWatchDLP (PowerShell Gallery)

Official PowerShell helpers for the **OctoWatch On-Premise Server** installer.

**Website:** [octowatchdlp.com](https://octowatchdlp.com/?utm_source=psgallery&utm_medium=asset&utm_campaign=psgallery_2026)  
**On-Premise:** [octowatchdlp.com/on-premise](https://octowatchdlp.com/on-premise/?utm_source=psgallery&utm_medium=asset&utm_campaign=psgallery_2026)  
**Docs:** [octowatchdlp.com/docs](https://octowatchdlp.com/docs/)  
**Source / packages:** [github.com/extralabs/octowatch-windows-packages](https://github.com/extralabs/octowatch-windows-packages)

> Note: The PowerShell Gallery package page shows the module **Description**, **Project Site**, and **Icon** — it does not render this README or embed product screenshots. This file ships with the module and is indexed on GitHub.

## Install

```powershell
Install-Module -Name OctoWatchDLP -Scope CurrentUser
Import-Module OctoWatchDLP
Get-OctoWatchInstallerInfo -Component Server
# Elevated session:
Install-OctoWatchServer
```

## Product screenshots (Web Console / On-Prem)

![OctoWatch Overview](https://raw.githubusercontent.com/extralabs/octowatch-windows-packages/master/media/overview-1.png)

![OctoWatch On-Premise Server status](https://raw.githubusercontent.com/extralabs/octowatch-windows-packages/master/media/local-server-system-status.png)

OctoWatch is Windows employee monitoring and endpoint DLP (activity, Live view, screens, keystrokes, Risks/Anomalies, Rules Profile). Publisher: **KOLIBRI LLC**. Not affiliated with Octo Browser.
