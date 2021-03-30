#Requires -Version 5

$ErrorActionPreference = "Stop"

$Config = "config.windows.yaml"
$DotbotDirectory = "dotbot"
$Dotbot = "bin/dotbot"

# Get private function definition files.
$Private = @( Get-ChildItem -Path $PSScriptRoot\windows\powershell\modules\Bootstrap-WindowsMachine\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )

# Import required functions.
Foreach ($import in @($Private)) {
  Try {
    . $import.fullname
  }
  Catch {
    Write-Error -Message "Failed to import function $($import.fullname): $_"
  }
}

Install-WinGetPackage -Package "AdoptOpenJDK.OpenJDK" -Version "11.0.10"
Install-WinGetPackage -Package "CodecGuide.K-LiteCodecPackStandard"
Install-WinGetPackage -Package "Discord.Discord"
Install-WinGetPackage -Package "Docker.DockerDesktop"
Install-WinGetPackage -Package "ElectronicArts.Origin"
Install-WinGetPackage -Package "EpicGames.EpicGamesLauncher"
Install-WinGetPackage -Package "GIMP.GIMP"
Install-WinGetPackage -Package "Git.Git"
Install-WinGetPackage -Package "GnuPG.GnuPG"
Install-WinGetPackage -Package "GOG.Galaxy"
Install-WinGetPackage -Package "Google.BackupAndSync"
Install-WinGetPackage -Package "Keybase.Keybase"
Install-WinGetPackage -Package "Microsoft.PowerToys"
Install-WinGetPackage -Package "Microsoft.VisualStudioCode-User-x64"
Install-WinGetPackage -Package "Python.Python"
Install-WinGetPackage -Package "Stremio.Stremio"
Install-WinGetPackage -Package "Ubisoft.Connect"
Install-WinGetPackage -Package "Valve.Steam"
Install-WinGetPackage -Package "WeMod.WeMod"

Enable-WindowsSubsystemForLinux

Set-Location $PSScriptRoot
git -C $DotbotDirectory submodule sync --quiet --recursive
git submodule update --init --recursive $DotbotDirectory

foreach ($PYTHON in ('python', 'python3', 'python2')) {
  # Python redirects to Microsoft Store in Windows 10 when not installed
    if (& { $ErrorActionPreference = "SilentlyContinue"
        ![string]::IsNullOrEmpty((&$PYTHON -V))
        $ErrorActionPreference = "Stop" }) {
      &$PYTHON $(Join-Path $PSScriptRoot -ChildPath $DotbotDirectory | Join-Path -ChildPath $Dotbot) -d $PSScriptRoot -c $Config $Args
      return
    }
}

Write-Error "Error: Cannot find Python."
