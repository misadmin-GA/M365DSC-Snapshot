using module .\M365Config

param(
    # Source config path for the comparison
    [Parameter(Mandatory)]
    [string]
    $origConfigName,

    # Destination config path for the comparison
    [Parameter(Mandatory)]
    [String]
    $newConfigName
)

Import-Module .\HelperModule

$configComponents =  @("EXOHostedContentFilterPolicy","EXOHostedConnectionFilterPolicy","EXOHostedOutboundSpamFilterPolicy")

# Define M365 Config object
$origFileName = $origConfigName + ".ps1"
$configObj = [M365Config]::New($origFileName, $configComponents, $origConfigName, (Join-Path $PSScriptRoot $origConfigName))

$newFileName = $newConfigName + ".ps1"
$otherConfigObj = [M365Config]::New($newFileName, $configComponents, $newConfigName,(Join-Path $PSScriptRoot $newConfigName))

$outPath = "$PSScriptRoot\ConfigDiffReport.html"

$configObj.GenerateDiffReport("HTML", $otherConfigObj)