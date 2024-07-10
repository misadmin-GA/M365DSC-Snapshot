using module .\M365Config

param (
    # Name of config for which to generate report
    [Parameter(Mandatory)]
    [String]
    $configName
)

Import-Module .\HelperModule

$configComponents =  @("EXOHostedContentFilterPolicy","EXOHostedConnectionFilterPolicy","EXOHostedOutboundSpamFilterPolicy")

# Define M365 Config object
$fileName = $configName + ".ps1"
$configObj = [M365Config]::New($fileName, $configComponents, $configName,(Join-Path $PSScriptRoot $configName))

$configObj.GenerateReport("Excel")