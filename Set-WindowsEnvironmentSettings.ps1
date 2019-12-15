If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`[Security.Principal.WindowsBuiltInRole] “Administrator”)) {
  Write-Warning “You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!”
  Break
}

# Uninstall OneDrive
$OneDriveProcess = Get-Process OneDrive -ErrorAction SilentlyContinue
if ($OneDriveProcess) {
  $OneDriveProcess | Stop-Process -Force
}
Remove-Variable OneDriveProcess

.$env:SystemRoot\SysWOW64\OneDriveSetup.exe /uninstall
Remove-Item -Path 'C:\OneDriveTemp' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path $env:LocalAppData\Microsoft\OneDrive -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path $env:ProgramAppData\'Microsoft OneDrive' -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path $env:UserProfile\OneDrive -Recurse -Force -ErrorAction SilentlyContinue
New-Item -Path Registry::HKEY_CLASSES_ROOT\CLSID -Name '{018D5C66-4533-4307-9B53-224DE2ED1FE6}' -ErrorAction SilentlyContinue
New-Item -Path Registry::HKEY_CLASSES_ROOT\Wow6432Node\CLSID -Name '{018D5C66-4533-4307-9B53-224DE2ED1FE6}' -ErrorAction SilentlyContinue
Set-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\CLSID\'{018D5C66-4533-4307-9B53-224DE2ED1FE6}' -Name System.IsPinnedToNameSpaceTree -Value 0
Set-ItemProperty -Path Registry::HKEY_CLASSES_ROOT\Wow6432Node\CLSID\'{018D5C66-4533-4307-9B53-224DE2ED1FE6}' -Name System.IsPinnedToNameSpaceTree -Value 0

# Enable Windows Features
Add-WindowsCapability -Online -Name NetFX3~~~~
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

# Windows configuration
Disable-BingSearch
Enable-MicrosoftUpdate
Install-WindowsUpdate -AcceptEula
Set-TaskbarOptions -AlwaysShowIconsOff
Set-TaskbarOptions -Combine Always
Set-TaskbarOptions -Dock Bottom
Set-TaskbarOptions -Size Large
Set-TaskbarOptions -UnLock
Set-WindowsExplorerOptions -DisableShowHiddenFilesFoldersDrives -DisableShowProtectedOSFiles -EnableShowFileExtensions -EnableShowFullPathInTitleBar -DisableOpenFileExplorerToQuickAccess -EnableShowRecentFilesInQuickAccess -EnableShowFrequentFoldersInQuickAccess -EnableExpandToOpenFolder -EnableShowRibbon

# Chocolatey packages
cinst chocolateygui -y
cinst discord -y
cinst gitkraken -y
cinst google-backup-and-sync -y
cinst googlechrome -y
cinst leagueoflegends -y
cinst linkshellextension -y
cinst peazip -y
cinst stremio -y
cinst vscode -y