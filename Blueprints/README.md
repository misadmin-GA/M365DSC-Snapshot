# O365 Config BluePrints

## Overview
BluePrints allow for the generation of diff reports comparing
a given O365 tenant configuration to a "golden standard" configuration.

**NOTE: Blueprints are not to be used for deploying security policies. The _Templates_ folder contains the config files for the purpose of deploying standard Security Policies**

## Performing a Comparison
To perform a comparison using M365DSC you simply run the below powershell command

```powershell
Assert-M365DSCBlueprint -BluePrintUrl [Url or local path to the .m365] -OutputReportPath [Full path to where to save the HTML report] -Credentials [Optional credentials for the tenant to assess]
```
