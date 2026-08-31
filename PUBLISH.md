# How to publish OctoWatch Server packages (from zero)

Repo: https://github.com/extralabs/octowatch-windows-packages  
Local copy: `_software_submit/octowatch-windows-packages/`  
Package ready: `octowatch-dlp-server` **6.0.9720.19098**

You need three separate accounts. Do them in any order.

---

## A) Chocolatey.org

### 1. Create account

1. Open https://community.chocolatey.org/  
2. Click **Register** / **Sign in** (top right).  
3. Confirm email.

### 2. Get API key

1. Sign in → click your username → **Account** / **My Account**.  
2. Find **API Key** (or https://community.chocolatey.org/account ).  
3. Copy the key (long string). Keep it private.

### 3. Install Chocolatey CLI (if missing)

In **elevated** PowerShell:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

Close and reopen the terminal. Check: `choco -v`

### 4. Save API key on this PC

```powershell
choco apikey --key "PASTE_YOUR_KEY_HERE" --source https://push.chocolatey.org/
```

### 5. Push the package

```powershell
cd "C:\Users\Dmitry\Local Sites\octowatchdlp\_software_submit\octowatch-windows-packages\chocolatey\octowatch-dlp-server"

# If .nupkg missing, rebuild:
choco pack

choco push octowatch-dlp-server.6.0.9720.19098.nupkg --source https://push.chocolatey.org/
```

### 6. After push

1. Open https://community.chocolatey.org/packages/octowatch-dlp-server  
2. Status will be **Waiting for maintainer** / moderation (can take days).  
3. Answer moderator comments if they ask about trial/license or silent install.

**Optional before push:** on a test VM with internet:

```powershell
choco install octowatch-dlp-server -s . -y --force
choco uninstall octowatch-dlp-server -y
```

---

## B) PowerShell Gallery

### 1. Create account

1. Open https://www.powershellgallery.com/  
2. **Sign in** (Microsoft / work / personal account).  
3. Complete one-time registration if prompted.

### 2. Get NuGet API key

1. Go to https://www.powershellgallery.com/account  
2. Or: avatar → **API Keys** → https://www.powershellgallery.com/account/apikeys  
3. **Create** a key:
   - Name: e.g. `OctoWatchDLP-publish`
   - Expires: your choice
   - Glob pattern: `OctoWatchDLP` (or `*`)
4. Copy the key **once** (shown only at creation).

### 3. Publish the module

In PowerShell 5.1+ (Windows PowerShell or pwsh):

```powershell
# One-time: allow gallery script if needed
Install-PackageProvider NuGet -Force
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

cd "C:\Users\Dmitry\Local Sites\octowatchdlp\_software_submit\octowatch-windows-packages"

# Dry run
Publish-Module -Path .\powershell\OctoWatchDLP -NuGetApiKey "PASTE_YOUR_KEY_HERE" -WhatIf -Verbose

# Real publish
Publish-Module -Path .\powershell\OctoWatchDLP -NuGetApiKey "PASTE_YOUR_KEY_HERE"
```

### 4. After publish

- Page: https://www.powershellgallery.com/packages/OctoWatchDLP  
- Test install:

```powershell
Install-Module OctoWatchDLP -Scope CurrentUser -Force
Get-OctoWatchInstallerInfo
```

Gallery is usually live within minutes (no long Chocolatey-style queue).

---

## C) winget (microsoft/winget-pkgs)

No API key. You need a **GitHub account** (you already have `extralabs`) and a **PR** into Microsoft’s repo.

### Option 1 — wingetcreate (easiest)

1. Install the tool:

```powershell
winget install Microsoft.WingetCreate
```

2. Restart terminal, then:

```powershell
wingetcreate login
# Opens browser → authorize GitHub for wingetcreate

cd "C:\Users\Dmitry\Local Sites\octowatchdlp\_software_submit\octowatch-windows-packages"

# Submit using our prepared folder (or let it rebuild from URL):
wingetcreate submit ".\winget\templates\OctoWatch.OctoWatchDLP.Server"
```

If `submit` asks for fork permissions, approve them. It opens a PR to `microsoft/winget-pkgs`.

Alternative from URL only:

```powershell
wingetcreate new https://octowatchdlp.com/OWServerSetup.exe
# Fill publisher = KOLIBRI LLC, id = OctoWatch.OctoWatchDLP.Server
# Prefer matching our templates under winget/templates/
```

### Option 2 — Manual PR

1. Open https://github.com/microsoft/winget-pkgs → **Fork**.  
2. Clone **your fork** (not ideal to clone full history if huge — use wingetcreate if possible).  
3. Copy folder:

   From:  
   `_software_submit\octowatch-windows-packages\winget\templates\OctoWatch.OctoWatchDLP.Server\`  

   To (in fork):  
   `manifests\o\OctoWatch\OctoWatchDLP.Server\6.0.9720.19098\`  

   Rename files so they stay as:
   - `OctoWatch.OctoWatchDLP.Server.yaml`
   - `OctoWatch.OctoWatchDLP.Server.installer.yaml`
   - `OctoWatch.OctoWatchDLP.Server.locale.en-US.yaml`

4. Commit, push branch, open PR against `microsoft/winget-pkgs` `master`.  
5. First PR: click **Sign CLA** when the bot comments.  
6. Wait for validation bots + human review (often several days).

Local check already done:

```powershell
winget validate --manifest "C:\Users\Dmitry\Local Sites\octowatchdlp\_software_submit\octowatch-windows-packages\winget\templates\OctoWatch.OctoWatchDLP.Server"
```

---

## Quick map

| Where | What you create | What you push | Result URL |
|-------|-----------------|---------------|------------|
| Chocolatey | Account + API key | `.nupkg` via `choco push` | community.chocolatey.org/packages/octowatch-dlp-server |
| PS Gallery | Account + NuGet API key | Module folder via `Publish-Module` | powershellgallery.com/packages/OctoWatchDLP |
| winget | GitHub + CLA | PR / wingetcreate | `winget install OctoWatch.OctoWatchDLP.Server` after merge |

## Do not put keys in Git

Never commit API keys into the repo or chat logs. Store only with `choco apikey` / local password manager.

## Grabber

Still deferred — ignore Grabber for these three publishes.
