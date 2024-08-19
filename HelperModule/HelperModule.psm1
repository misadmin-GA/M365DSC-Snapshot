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

function Get-M365DSCWorkloads
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true, Position = 1)]
        [System.Array]
        $ResNames = @()
    )

    [Array]$workloads = @()
    foreach ($res in $ResNames)
    {
        switch ($res.Substring(0, 2).ToUpper())
        {
            'AA'
            {
                if (-not $workloads.Name -or -not $workloads.Name.Contains('MicrosoftGraph'))
                {
                    $workloads += @{
                        Name                 = 'MicrosoftGraph'
                        AuthenticationMethod = $res.AuthenticationMethod
                    }
                }
            }
            'EX'
            {
                if (-not $workloads.Name -or -not $workloads.Name.Contains('ExchangeOnline'))
                {
                    $workloads += @{
                        Name                 = 'ExchangeOnline'
                        AuthenticationMethod = $res.AuthenticationMethod
                    }
                }
            }
            'In'
            {
                if (-not $workloads.Name -or -not $workloads.Name.Contains('MicrosoftGraph'))
                {
                    $workloads += @{
                        Name                 = 'MicrosoftGraph'
                        AuthenticationMethod = $res.AuthenticationMethod
                    }
                }
            }
            'O3'
            {
                if (-not $workloads.Name -or -not $workloads.Name.Contains('MicrosoftGraph') -and $res -eq 'O365Group')
                {
                    $workloads += @{
                        Name                 = 'MicrosoftGraph'
                        AuthenticationMethod = $res.AuthenticationMethod
                    }
                }
                elseif (-not $workloads.Name -or -not $workloads.Name.Contains('ExchangeOnline'))
                {
                    $workloads += @{
                        Name                 = 'ExchangeOnline'
                        AuthenticationMethod = $res.AuthenticationMethod
                    }
                }
            }
            'OD'
            {
                if (-not $workloads.Name -or -not $workloads.Name.Contains('PnP'))
                {
                    $workloads += @{
                        Name                 = 'PnP'
                        AuthenticationMethod = $res.AuthenticationMethod
                    }
                }
            }
            'Pl'
            {
                if (-not $workloads.Name -or -not $workloads.Name.Contains('MicrosoftGraph'))
                {
                    $workloads += @{
                        Name                 = 'MicrosoftGraph'
                        AuthenticationMethod = $res.AuthenticationMethod
                    }
                }
            }
            'SP'
            {
                if (-not $workloads.Name -or -not $workloads.Name.Contains('PnP'))
                {
                    $workloads += @{
                        Name                 = 'PnP'
                        AuthenticationMethod = $res.AuthenticationMethod
                    }
                }
            }
            'SC'
            {
                if (-not $workloads.Name -or -not $workloads.Name.Contains('SecurityComplianceCenter'))
                {
                    $workloads += @{
                        Name                 = 'SecurityComplianceCenter'
                        AuthenticationMethod = $res.AuthenticationMethod
                    }
                }
            }
            'Te'
            {
                if (-not $workloads.Name -or -not $workloads.Name.Contains('MicrosoftTeams'))
                {
                    $workloads += @{
                        Name                 = 'MicrosoftTeams'
                        AuthenticationMethod = $res.AuthenticationMethod
                    }
                }
            }
        }
    }
    return ($workloads | Sort-Object {$_.Name})
}