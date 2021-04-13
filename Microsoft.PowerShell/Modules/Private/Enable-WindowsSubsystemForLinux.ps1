#Requires -Version 5
#Requires -RunAsAdministrator

<#
.SYNOPSIS
    Enables WSL2 on the current machine.
.EXAMPLE
    PS :> Enable-WindowsSubsystemForLinux
.NOTES
    Name: Enable-WindowsSubsystemForLinux
    Author: Rafael "Rafifos" Julio <development@rafifos.dev>
    DateCreated: 16/02/2021
#>
Function Enable-WindowsSubsystemForLinux {
  Begin {
    Write-Host "Enabling WSL2..."
    $OutFile = New-Item -Path 'wsl_update_x64.msi' -ItemType 'File'
  }

  Process {
    Try {
      # Required optional features.
      Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
      Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform

      # Required packages
      Invoke-WebRequest -Uri 'https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi' -OutFile $OutFile
      Start-Process -FilePath $OutFile
    }
    Catch {
      Write-Host -BackgroundColor Red "Error: $($_.Exception)"
      Break
    }
  }

  End {
    If ($?) {
      Write-Host "Completed Successfully. You can now install a Distribution from the Microsoft Store."
      Write-Host " "
    }
  }
}
