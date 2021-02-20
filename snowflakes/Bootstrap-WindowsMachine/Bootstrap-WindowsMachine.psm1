#Requires -Version 5

# Get private function definition files.
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -Recurse -ErrorAction SilentlyContinue )

# Import required functions.
Foreach ($import in @($Private)) {
  Try {
    . $import.fullname
  }
  Catch {
    Write-Error -Message "Failed to import function $($import.fullname): $_"
  }
}

# Community-driven, Vendor-neutral build of OpenJDK for Windows x64.
Install-WinGetPackage -Package "AdoptOpenJDK.OpenJDK" -Version "11.0.10"

# Easy and secure access to all of your content. Store, share, and collaborate on files and folders from any mobile
# device, tablet, or computer.
Install-WinGetPackage -Package "Google.BackupAndSync"

# Whether you’re part of a school club, gaming group, worldwide art community, or just a handful of friends that want to
# spend time together, Discord makes it easy to talk every day and hang out more often.
Install-WinGetPackage -Package "Discord.Discord"

# Docker Desktop is an application for MacOS and Windows machines for the building and sharing of containerized
# applications. Access Docker Desktop and follow the guided onboarding to build your first containerized application in
# minutes.
Install-WinGetPackage -Package "Docker.DockerDesktop"

# Epic Games Launcher for the Epic Games Store and Unreal Engine.
Install-WinGetPackage -Package "EpicGames.EpicGamesLauncher"

# GIMP is an acronym for GNU Image Manipulation Program. It is a freely distributed program for such tasks as photo
# retouching, image composition and image authoring.
Install-WinGetPackage -Package "GIMP.GIMP"

# GOG GALAXY 2.0 allows you to combine multiple game libraries into one and connect with your friends across all gaming
# platforms, consoles included!
Install-WinGetPackage -Package "GOG.Galaxy"

# A fast, secure, and free web browser built for the modern web. Chrome syncs bookmarks across all your devices, fills
# out forms automatically, and so much more.
Install-WinGetPackage -Package "Google.Chrome"

# The K-Lite Codec Pack is a collection of DirectShow filters, VFW/ACM codecs, and tools. Codecs and DirectShow filters
# are needed for encoding and decoding audio and video formats. The K-Lite Codec Pack is designed as a user-friendly
# solution for playing all your audio and movie files. With the K-Lite Codec Pack you should be able to play all the
# popular audio and video formats and even several less common formats.
Install-WinGetPackage -Package "CodecGuide.K-LiteCodecPackStandard"

# Visual Studio Code is a code editor redefined and optimized for building and debugging modern web and cloud
# applications. Visual Studio Code is free and available on your favorite platform - Linux, macOS, and Windows.
Install-WinGetPackage -Package "Microsoft.VisualStudioCode-User-x64"

# Play great PC games and connect with your friends, all in one place.
Install-WinGetPackage -Package "ElectronicArts.Origin"

# Steam is a digital distribution platform developed by Valve Corporation for purchasing and playing video games. Steam
# offers digital rights management, matchmaking servers, video streaming, and social networking services.
Install-WinGetPackage -Package "Valve.Steam"

# Ubisoft Connect is the ecosystem of players services for Ubisoft games across all platforms. It aims at giving the
# best environment for all players to enjoy their games and connect with each other whatever the device.
Install-WinGetPackage -Package "Ubisoft.Connect"

# Free cheats & trainers for your favorite PC games in one easy app.
Install-WinGetPackage -Package "WeMod.WeMod"

# Microsoft PowerToys is a set of utilities for power users to tune and streamline their Windows experience for greater
# productivity. Inspired by the Windows 95 era PowerToys project, this reboot provides power users with ways to squeeze
# more efficiency out of the Windows 10 shell and customize it for individual workflows.
Install-WinGetPackage -Package "Microsoft.PowerToys"

# End of package installation, WinGet does not _yet_ supports installing packages from the Microsoft Store.
Write-Host "Install completed."
Write-Host "Microsoft Store packages needs to be installed manually."
Pause

# Warn users about external packages and optional features that need to be enabled.
Write-Host "Enabling WSL2..."
Enable-WindowsSubsystemForLinux

# Wohoo, we're done..
Write-Host "Done. Goodbye."
Pause
