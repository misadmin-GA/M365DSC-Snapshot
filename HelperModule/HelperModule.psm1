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

# Returns hashmap of a resource and its respective workload
# This is for the generation of the resources checklist in Tenant Export User Interface
function Get-M365DSCWorkload
{
	[OutputType([System.Collections.Hashtable])]
	param
	(
		[Parameter(Mandatory = $true, Position = 1)]
		[System.String]$ResName = ""
	)
	
	$workload = @{}
	
	switch ($ResName.Substring(0, 2).ToUpper())
	{
		'AA'
		{
			if (-not $workload.WorkloadName -or -not $workload.WorkloadName.Contains('AzureAD'))
			{
				$workload = @{
					WorkloadName		 = 'Azure AD'
					Resource			 = $ResName
				}
			}
		}
		'EX'
		{
			if (-not $workload.WorkloadName -or -not $workload.WorkloadName.Contains('ExchangeOnline'))
			{
				$workload = @{
					WorkloadName		 = 'ExchangeOnline'
					Resource 			 = $ResName
				}
			}
		}
		'In'
		{
			if (-not $workload.WorkloadName -or -not $workload.WorkloadName.Contains('Intune'))
			{
				$workload = @{
					WorkloadName		 = 'Intune'
					Resource 	 		 = $ResName
				}
			}
		}
		'O3'
		{
			if (-not $workload.WorkloadName -or -not $workload.WorkloadName.Contains('O365'))
			{
				$workload = @{
					WorkloadName		 = 'O365'
					Resource 			 = $ResName
				}
			}
			elseif (-not $workload.WorkloadName -or -not $workload.WorkloadName.Contains('ExchangeOnline'))
			{
				$workload = @{
					WorkloadName		 = 'ExchangeOnline'
					Resource 			 = $ResName
				}
			}
		}
		'OD'
		{
			if (-not $workload.WorkloadName -or -not $workload.WorkloadName.Contains('PnP'))
			{
				$workload = @{
					WorkloadName		 = 'OneDrive'
					Resource 			 = $ResName
				}
			}
		}
		'Pl'
		{
			if (-not $workload.WorkloadName -or -not $workload.WorkloadName.Contains('MicrosoftGraph'))
			{
				$workload = @{
					WorkloadName		 = 'Planner'
					Resource 			 = $ResName
				}
			}
		}
		'SP'
		{
			if (-not $workload.WorkloadName -or -not $workload.WorkloadName.Contains('PnP'))
			{
				$workload = @{
					WorkloadName		 = 'SharePoint'
					Resource 			 = $ResName
				}
			}
		}
		'SC'
		{
			if (-not $workload.WorkloadName -or -not $workload.WorkloadName.Contains('SecurityComplianceCenter'))
			{
				$workload = @{
					WorkloadName		 = 'SecurityComplianceCenter'
					Resource 			 = $ResName
				}
			}
		}
		'Te'
		{
			if (-not $workload.WorkloadName -or -not $workload.WorkloadName.Contains('MicrosoftTeams'))
			{
				$workload = @{
					WorkloadName		 = 'MicrosoftTeams'
					Resource 			 = $ResName
				}
			}
		}
	}
	return $workload
}

# Function for returning distinct workloads used from a list of M365DSC Resources
function Get-M365DSCWorkloads
{
    param
    (
        [Parameter(Mandatory = $true, Position = 1)]
        [System.Array]
        $ResNames = @()
    )

    [String[]]$workloads = @()
    foreach ($res in $ResNames)
    {
        switch ($res.Substring(0, 2).ToUpper())
        {
            'AA'
            {
                if (-not $workloads -or -not $workloads.Contains('AzureAD'))
                {
                    $workloads += 'AzureAD'
                }
            }
            'EX'
            {
                if (-not $workloads -or -not $workloads.Contains('ExchangeOnline'))
                {
                    $workloads += 'ExchangeOnline'
                }
            }
            'In'
            {
                if (-not $workloads -or -not $workloads.Contains('Intune'))
                {
                    $workloads += 'Intune'
                }
            }
            'O3'
            {
                if (-not $workloads -or -not $workloads.Contains('O365'))
                {
                    $workloads += 'O365'
                }
                elseif (-not $workloads -or -not $workloads.Contains('ExchangeOnline'))
                {
                    $workloads += 'ExchangeOnline'
                }
            }
            'OD'
            {
                if (-not $workloads -or -not $workloads.Contains('OneDrive'))
                {
                    $workloads += 'OneDrive'
                }
            }
            'Pl'
            {
                if (-not $workloads -or -not $workloads.Contains('Planner'))
                {
                    $workloads += 'Planner'
                }
            }
            'SP'
            {
                if (-not $workloads -or -not $workloads.Contains('SharePoint'))
                {
                    $workloads += 'SharePoint'
                }
            }
            'SC'
            {
                if (-not $workloads -or -not $workloads.Contains('SecurityComplianceCenter'))
                {
                    $workloads += 'SecurityComplianceCenter'
                }
            }
            'Te'
            {
                if (-not $workloads -or -not $workloads.Contains('MicrosoftTeams'))
                {
                    $workloads += 'MicrosoftTeams'
                }
            }
        }
    }
    return ($workloads | Sort-Object {$_})
}