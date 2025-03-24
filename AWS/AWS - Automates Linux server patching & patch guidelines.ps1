# Import AWS PowerShell module
Import-Module AWSPowerShell

# Set AWS region
$region = "us-east-1"  # Replace with your desired AWS region

# Target instance tags for patching (Specify the key-value pair for Linux instances)
$patchingTagKey = "Environment"
$patchingTagValue = "Production"

# Create a patch baseline for Linux servers
$patchBaseline = New-SSMPatchBaseline -Name "LinuxPatchBaseline" `
                                       -OperatingSystem "AmazonLinux" `
                                       -ApprovedPatchesComplianceLevel "HIGH" `
                                       -ApprovalRules @{
                                           PatchRules = @(
                                               @{
                                                   ComplianceLevel = "CRITICAL"
                                                   EnableNonSecurityPatches = $false
                                                   ApproveAfterDays = 7
                                               }
                                           )
                                       } `
                                       -Region $region
Write-Host "Patch Baseline created successfully with ID: $($patchBaseline.BaselineId)"

# Attach patch baseline to Linux instances
$instances = Get-SSMInstance -Region $region | Where-Object {
    $_.InstanceInformation.Tags.$patchingTagKey -eq $patchingTagValue
}

foreach ($instance in $instances.InstanceInformationList) {
    $instanceId = $instance.InstanceId

    # Run patching using Systems Manager Run Command
    Send-SSMCommand -InstanceIds $instanceId `
                    -DocumentName "AWS-RunPatchBaseline" `
                    -Parameters @{
                        Operation = "Install"
                    } `
                    -Region $region

    Write-Host "Patching initiated for instance ID: $instanceId"
}

Write-Host "Patching process completed for all target instances in region '$region'."
