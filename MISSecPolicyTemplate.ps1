# MISSecPolicyTemplate.ps1 - Script for retrieiving the latest 365 tenant template
#                            containing MIS Standard Security Policies


# Use M365 config helper class
using module .\M365Config

param (
    # Desired name for generated tenant config
    [Parameter(Mandatory)]
    [String]
    $configName
)

# Import Helper Module
Import-Module .\HelperModule

$configComponents =  @("EXOSafeLinksPolicy", "EXOSafeAttachmentPolicy")

# Define M365 Config object
$fileName = $configName + ".ps1"
$configObj = [M365Config]::New($fileName, $configComponents, $configName, (Join-Path $PSScriptRoot $configName))

# Test Export
$creds = GetCreds
$res = $configObj.Export($creds)

if ($res -lt 0)
{
    Write-Output "[!] Issue exporting config...."
    exit
}
Write-Output "[+] Config Export successful"

# Test Compile
$creds = GetCreds
$res = $configObj.Compile($creds)

if ($res -lt 0)
{
    Write-Output "[!] Issue compiling config...."
    exit
}
Write-Output "[+] Config Compilation successful"

Test Deploy
$res = $configObj.Deploy()
if ($res -lt 0)
{
    Write-Output "[!] Issue deploying config...."
    exit
}
Write-Output "[+] Config Deployment successful"

