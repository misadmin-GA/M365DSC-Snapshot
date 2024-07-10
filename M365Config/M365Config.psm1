# M365DSC Helper Class - An object of this class represents an O365 tenant configuration
class M365Config
{
    [String]$fileName           # Name of the config file to be generated
    [String[]]$components       # O365 tenant components to be stored in this Object
    [String]$configDir          # Directory of config compiled from $fileName
    [String]$rootPath           # Root Directory of DSC Exported Config
    [String]$exportPath         # Full Path of exported config
    [String]$mofPath            # Path of .mof file generated during compilation
    [String]$reportsPath        # Default directory for storing generated reports

    M365Config()
    {
        $this.fileName = "M365Config.ps1"
        $this.components = @("")
        $this.configDir = $this.fileName.Split('.')[0]
    }

    # Constructor for M365DSCConfig
    M365Config([String]$file, [String[]]$components, [String]$name, [String]$path)
    {
        $this.fileName = $file
        $this.components = $components
        $this.configDir = $name
        $this.rootPath = $path
        $this.exportPath = (Join-Path $this.rootPath $this.fileName)
        $this.mofPath = (Join-Path $this.rootPath $this.configDir)
        $this.reportsPath = (Join-Path $this.rootPath "ConfigReports")
    }

    # Export the config to the specified file path
    [int] Export([PSCredential]$creds)
    {
        try
        {
            Export-M365DSCConfiguration -Components $this.components -Credential $creds `
            -Path $this.rootPath `
            -FileName $this.fileName 
        }
        catch
        {
            Write-Output "[!] " + $_.Exception.Message
            return -1
        }

        return 0
    }

    # Compile the exported cofig using specified creds (can be either original src or dest 365 tenant)
    # This function generates the necessary .mof file for deploying to a 365 tenant
    [int] Compile([PSCredential]$creds)
    {
        try
        {
            # Finally compile the .mof config file for the MS365 tenant
            Push-Location $this.rootPath
            & (Join-Path $this.rootPath $this.fileName) -Credential $creds
            Pop-Location
        }
        catch
        {
            Write-Output "[!] " + $_.Exception.Message
            return -1
        }

        return 0
    }

    # Deploy a compiled config using tenant creds configured in the .mof file
    [int] Deploy()
    {
        try
        {
            # Deploy the configuration stored in this local repo to the destination tenant 
            # using provided credentials and place output in log file named M365DSCDeployment_<timestamp>.log
            
            # TODO: $logFile not being correctly created - causes Deployment to fail
            Start-DSCConfiguration -Path $this.mofPath -Verbose -Wait -Force 

            # Stop periodic configuration checks
            Stop-DSCConfiguration -Force
            Remove-DSCConfigurationDocument -Stage Current
        }
        catch
        {
            Write-Output "[!] " + $_.Exception.Message
            return -1
        }
        return 0
    }

    # Generate a report of the current configuration
    # NOTE: The output path must be the the full path e.g. C:\DSC\configReportPath.xlsx
    GenerateReport([String]$reportType, [String]$outputPath)
    {
        $configReportPath = $null

        # If no Report Output Path is specified, use $this.reportsPath
        if (!($outputPath))
        { 
            # Determine the file name based on provided report type
            $defaultFileName = if ($reportType -contains "Excel") { "M365ConfigReport.xlsx" } else { "M365ConfigReport." + $reportType.ToLower() }
            $configReportPath = (Join-Path $this.reportsPath $defaultFileName)

            # Create the Reports directory if doesn't already exist
            if (!(Test-Path $this.reportsPath)) { New-Item -Path $this.reportsPath -ItemType "directory" }
        }
        else
        { 
            $configReportPath = $outputPath
        }

        New-M365DSCReportFromConfiguration -Type $reportType `
            -ConfigurationPath $this.exportPath `
            -OutputPath $configReportPath
    }

    # Overload of GenerateReport function for when output path is not provided
    GenerateReport([String]$reportType)
    {
        $this.GenerateReport($reportType, $null)
    }

    # Generate a delta report of this config and another provided config object
    # NOTE: The output path must be the the full path e.g. C:\DSC\configReportPath.xlsx
    GenerateDiffReport([String]$reportType, [M365Config]$otherConfig, [String]$outputPath)
    {
        if ($reportType.ToLower() -contains "excel")
        {
            Write-Error "[!] Excel is not a valid report type for Diff Reports...exiting"
            exit
        }

        $diffReportPath = $null

        # If no Report Output Path is specified, use $this.reportsPath
        if (!($outputPath))
        { 
            $defaultFileName = "M365ConfigDiffReport." + $reportType.ToLower()
            $diffReportPath = (Join-Path $this.reportsPath $defaultFileName)

            # Create the Reports directory if doesn't already exist
            if (!(Test-Path $this.reportsPath)) { New-Item -Path $this.reportsPath -ItemType "directory" }
        }
        else
        { 
            $diffReportPath = $outputPath
        }

        New-M365DSCDeltaReport -Source $this.exportPath -Destination $otherConfig.exportPath `
            -OutputPath $diffReportPath
    }

    # Overload of GenerateDiffReport function for when output path is not provided
    GenerateDiffReport([String]$reportType, [M365Config]$otherConfig)
    {
        $this.GenerateDiffReport($reportType, $otherConfig, $null)
    }
}