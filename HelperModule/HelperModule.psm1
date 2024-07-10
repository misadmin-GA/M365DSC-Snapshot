# HelperModule.psm1 - Convenience module containing re-usable functions

function GetCreds
{
    $creds = $null
    try
    {
        $creds = Get-Credential -Message "Enter O365 credentials"
    }
    catch
    {
        Write-Output "No credentials provided... exiting"
        exit
    }

    if (($null -eq $creds) -or ($creds.Password.Length -eq 0))
    {
        Write-Output "No credentials provided... exiting"
        exit
    }

    return $creds    
}

# Function for generating a new M365DSC Agent Certificate of compliled configs
function Generate365DSCCertificate
{
    Set-M365DSCAgentCertificateConfiguration -ForceRenew
}