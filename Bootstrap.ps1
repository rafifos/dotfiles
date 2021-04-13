#Requires -Version 5

$ErrorActionPreference = "Stop"
$Config = "Config.yaml"
$DotbotDirectory = "dotbot"
$Dotbot = "bin/dotbot"
$PrivateFunctions = @( Get-ChildItem -Path $PSScriptRoot\Microsoft.PowerShell\Modules\Bootstrap-WindowsMachine\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )

# Import required functions.
Foreach ($Import in @($PrivateFunctions)) {
  Try {
    . $Import.FullName
  }
  Catch {
    Write-Error -Message "Failed to import function $($Import.FullName): $_"
  }
}

# Install required modules.
Install-Module -Name WinGet
Install-PackageProvider WinGet -Force

Install-Package -Name "AdoptOpenJDK.OpenJDK" -Version "11.0.10" -Provider WinGet
Install-Package -Name "CodecGuide.K-LiteCodecPackStandard" -Provider WinGet
Install-Package -Name "Discord.Discord" -Provider WinGet
Install-Package -Name "Docker.DockerDesktop" -Provider WinGet
Install-Package -Name "ElectronicArts.Origin" -Provider WinGet
Install-Package -Name "EpicGames.EpicGamesLauncher" -Provider WinGet
Install-Package -Name "GIMP.GIMP" -Provider WinGet
Install-Package -Name "Git.Git" -Provider WinGet
Install-Package -Name "GnuPG.GnuPG" -Provider WinGet
Install-Package -Name "GOG.Galaxy" -Provider WinGet
Install-Package -Name "Google.BackupAndSync" -Provider WinGet
Install-Package -Name "Keybase.Keybase" -Provider WinGet
Install-Package -Name "Microsoft.PowerToys" -Provider WinGet
Install-Package -Name "Microsoft.VisualStudioCode-User-x64" -Provider WinGet
Install-Package -Name "Python.Python" -Provider WinGet
Install-Package -Name "Stremio.Stremio" -Provider WinGet
Install-Package -Name "Ubisoft.Connect" -Provider WinGet
Install-Package -Name "Valve.Steam" -Provider WinGet
Install-Package -Name "WeMod.WeMod" -Provider WinGet

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
