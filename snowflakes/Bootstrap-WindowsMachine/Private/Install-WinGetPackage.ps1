#Requires -Version 5

<#
.SYNOPSIS
    Installs WinGet packages.
.EXAMPLE
    PS :> Install-WinGetPackage -Package 'Discord.Discord'
.PARAMETER Package
    Package to be installed.
.PARAMETER Version
    Version of $Package to install, if applicable.
.PARAMETER Silent
    Whether or not to silent output. (Defalt: True)
.NOTES
    Name: Install-WinGetPackage
    Author: Rafael "Rafifos" Julio <development@rafifos.dev>
    DateCreated: 16/02/2021
#>
Function Install-WinGetPackage {
  [CmdletBinding(DefaultParameterSetName = 'Parameters',
    PositionalBinding = $False,
    HelpUri = 'http://www.microsoft.com/',
    ConfirmImpact = 'Medium')]
  Param (
    [Parameter(Mandatory = $True,
      Position = 0,
      ValueFromPipelineByPropertyName = $True,
      ParameterSetName = 'Parameters')]
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [string]$Package,

    [Parameter(Mandatory = $False,
      Position = 1,
      ValueFromPipelineByPropertyName = $True,
      ParameterSetName = 'Parameters')]
    [string]$Version,

    [Parameter(Mandatory = $False,
      Position = 2,
      ValueFromPipelineByPropertyName = $True,
      ParameterSetName = 'Parameters')]
    [boolean]$Silent = $True
  )

  Begin {
    if (-Not ($Silent)) {
      Write-Host 'Checking if WinGet is installed...'
    }

    if (-Not (Get-Command -ErrorAction Ignore -Type Application 'winget') ) {
      Write-Host "You don't seem to have installed WinGet, this is absolutely required in order to run correctly."
      Write-Host "Follow the instructions at https://docs.microsoft.com/en-US/windows/package-manager/winget to install it."
      Exit 1
    }
  }

  Process {
    Try {
      if ($Version) {
        winget install --exact --interactive --id $Package --version $Version
      }
      else {
        winget install --exact --interactive --id $Package
      }
    }
    Catch {
      Write-Host -BackgroundColor Red "Error: $($_.Exception)"
      Break
    }
  }


  End {
    If ($?) {
      Write-Host "Completed Successfully."
      Write-Host " "
    }
  }
}
