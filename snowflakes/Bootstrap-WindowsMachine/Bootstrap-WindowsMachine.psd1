$PowerShellModule = 'Bootstrap-WindowsMachine'
$AuthorName = 'Rafael "Rafifos" Julio <development@rafifos.dev>'

@{
    GUID                  = 'eb3b3df9-8f80-407e-bcf9-4cdfe1974918'
    PowerShellVersion     = 5
    CompatiblePSEditions  = @(5, 6)
    ProcessorArchitecture = 'Amd64'
    RootModule            = "$PowerShellModule.psm1"
    Author                = "$AuthorName"
    Description           = 'I Just made this script to help me setup a Windows machine the way I like, it has nothing too fancy.'
    ModuleVersion         = '0.0.1.0'
    FunctionsToExport     = @()
    CmdletsToExport       = @()
    VariablesToExport     = '*'
    AliasesToExport       = @()
}
